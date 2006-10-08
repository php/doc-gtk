<?php
/**
*   Updates docbook class files by adding missing methods and
*   constructors.
*
*   Call:
*   ./doUpdate.sh file.xml file2.xml ...
*
*   The doUpdate.sh script first calls prepxpath.php which
*   adds some XML entities needed for the DOM parser.
*   After finishing this script, remxpath.php removes
*   the entities.
*
*   TODO:
*   - add void if no return value
*   - add void if no parameters
*   - check existing methods
*   - check method parameters
*   - beautify output / get rid of those indent* xml nodes
*   - write test cases
*
*   @author Anant Narayanan <anant@kix.in>
*   @author Christian Weiske <cweiske@php.net>
*/
class UpdateMethods
{
    /* Stores class under consideration and missing classes */
    public $methodCount=0;
    public $missingClasses = array();



    function __construct()
    {
        //remove own filename
        array_shift($GLOBALS['argv']);

        $files = $GLOBALS['argv'];
        foreach ($files as $file) {
            if (substr($file, -4) != '.xml') {
                echo '"' . $file . "\" is no xml file\n";
                continue;
            }
            if (!file_exists($file)) {
                echo 'File "' . $file . "\" does not exist\n";
                continue;
            }

            $classname = substr(basename($file), 0, -4);
            $this->updateClass($classname, $file);
        }
    }//function __construct()



    /**
    *   Takes a class- and a filename ("class" and "class.xml")
    *   and checks the methods and constructors, fixing them
    *   perhaps.
    *
    *   @param string $classname    Name of the class to check (can be all-lowercase, will be fixed in here)
    *   @param string $file         Filename in which the docs for the class reside.
    */
    function updateClass($classname, $file)
    {
        /* Obtain reflection object for current class */
        if (!class_exists($classname)) {
            include_once $classname . '.php';
        }
        try {
            $refObject  = new ReflectionClass($classname);
        } catch (ReflectionException $re) {
            echo 'Error getting ReflectionClass: ' . $re->getMessage() . "\n";
            return;
        }
        $refObject      = new ReflectionClass($classname);
        $classname      = $refObject->getName();
        echo 'Checking ' . str_pad($classname, 20, ' ');
        $childMethods   = $refObject->getMethods();
        $parent         = $refObject->getParentClass();

        if ($parent === false) {
            $parent     = null;
        }
        if ($parent !== null) {
            $parentMethods = $parent->getMethods();
            $trueMethods   = $this->cleanMethods($childMethods, $parentMethods);
        } else {
            $trueMethods   = $childMethods;
        }
        echo ' ' . str_pad(count($trueMethods), 3) . " methods\n";
        $xml = new DOMDocument();
        if ($xml->load($file)) {
            $xpath = new DOMXPath($xml);
            foreach ($trueMethods as $key => $methodObj) {
                /* Update each method */
                $this->updateMethod($classname, $file, $key, $methodObj, $xml, $xpath);
            }
        } else {
            echo 'XML is broken in ' . $file . " - skipping.\n";
        }
    }//function updateClass($classname, $file)



    /**
    *   Updates the docs for a class' method.
    *   Currently, only creates new docs and does not check existing ones.
    *
    *   @param string $classname    Name of the class which method to check
    *   @param string $file         Documentation file of the class
    *   @param string $sNo          ??? (unused)
    *   @param ReflectionMethod $method     Method to check/fix
    *   @param DOMDocument      $doc        DOM document object
    *   @param DOMXPath         $xpath      DOM XPath object for the document
    */
    function updateMethod($classname, $file, $sNo, $method, $doc, $xpath)
    {
        $methodName = $method->getName();
        $compelArgs = $method->getNumberOfRequiredParameters();
        $totalArgs  = $method->getNumberOfParameters();

        preg_match_all('/^([A-Z][a-z]{2,5})[A-Z]/', $classname, $matches);
        if (isset($matches[1][0])) {
            $prefix = strtolower($matches[1][0]);
        } else {
            $prefix = strtolower(substr($classname, 0, 3));
            echo 'Could not determine prefix for class "' . $classname . '". Using "' . $prefix . "\"\n";
        }

        $daClass = strtolower($classname);
        $daMethod = strtolower($methodName);

        if ($methodName == "__construct") {
            //constructor
            $ismethod = false;
            $daID = $prefix . '.' . $daClass . '.constructor';
        } else if (substr($methodName, 0, 3) == "new") {
            //constructor
            $ismethod = false;
            $daID = $prefix . '.' . $daClass . '.constructor.' . $daMethod;
        } else if (substr($methodName, 0, 2) == '__') {
            return;
        } else {
            //normal method
            $ismethod = true;
            $daID = $prefix . '.' . $daClass . '.method.' . $daMethod;
        }


        if ($ismethod) {
            $path = '/classentry/methods/method[@id="' . $daID . '"]';
        } else {
            $path = '/classentry/constructors/constructor[@id="' . $daID . '"]';
        }
        $functionNodes =
            $xpath->query($path);


        if ($functionNodes->length == 0) {
            /* Method not present, Add it */
            if ($ismethod) {
                $xmlMethod = $doc->createElement('method', "\n    ");
            } else {
                $xmlMethod = $doc->createElement('constructor', "\n   ");
            }
            $xmlMethod->setAttribute('id', $daID);

            $xmlSynopsis = $doc->createElement('funcsynopsis', "\n    ");
            $xmlPrototype = $doc->createElement('funcprototype', "\n     ");
            $xmlFuncdef = $doc->createElement('funcdef', " ");
            if ($ismethod || $methodName == "__construct") {
                $xmlFunction = $doc->createElement('function', $daMethod);
            } else {
                //alternative constructors need Classname::new_* as funcname
                $xmlFunction = $doc->createElement('function', $classname . '::' . $daMethod);
            }

            $xmlFuncdef->appendChild($xmlFunction);
            $xmlParamDefs = array();

            if ($totalArgs > 0) {
                /* Function has arguments */
                foreach ($method->getParameters() as $param) {
                    $xmlParamdef = $doc->createElement('paramdef');
                    if ($param->getClass()) {
                        /* Parameter is of object type */
                        $xmlClassname = $doc->createElement('classname', $param->getClass()->getName());
                        $xmlParamdef->appendChild($xmlClassname);
                    }
                    $xmlParameter = $doc->createElement('parameter');
                    if ($param->isOptional()) {
                        /* Parameter is optional */
                        if ($param->isDefaultValueAvailable()) {
                            /* Parameter has default value */
                            $xmlOptional =
                                $doc->createElement('optional', $param->getName()."=".$param->getDefaultValue());
                        } else {
                            $xmlOptional =
                                $doc->createElement('optional', $param->getName());
                        }
                        $xmlParameter->appendChild($xmlOptional);
                    } else {
                        $xmlParameter->nodeValue = $param->getName();
                    }
                    $xmlParamdef->appendChild($xmlParameter);
                    $xmlParamDefs[] = $xmlParamdef;
                }
            }
            else {
                /* Function has NO arguments */
                $xmlParamdef = $doc->createElement('paramdef', "void");
            }

            /* Filler nodes to maintain indentation :) */
            $indentFuncdef   = $doc->createTextNode("\n     ");
            $indentParamdef  = $doc->createTextNode("\n    ");
            $indentPrototype = $doc->createTextNode("\n   ");
            $indentSynopsis  = $doc->createTextNode("\n   ");
            $indentShortDesc = $doc->createTextNode("\n   ");
            $indentDesc      = $doc->createTextNode("\n  ");
            $indentMethod    = $doc->createTextNode("\n\n  ");

            /* Appending child nodes in order */
            $xmlPrototype->appendChild($xmlFuncdef);
            $xmlPrototype->appendChild($indentFuncdef);
            foreach ($xmlParamDefs as $def) {
                $xmlPrototype->appendChild($xmlParamdef);
            }
            $xmlPrototype->appendChild($indentParamdef);
            $xmlSynopsis->appendChild($xmlPrototype);
            $xmlSynopsis->appendChild($indentPrototype);

            /* Add nodes for shortdesc and desc */
            $xmlShortDesc = $doc->createElement('shortdesc', "\n\n   ");
            $xmlDesc      = $doc->createElement('desc', "\n\n   ");
            $xmlMethod->appendChild($xmlSynopsis);
            $xmlMethod->appendChild($indentSynopsis);
            $xmlMethod->appendChild($xmlShortDesc);
            $xmlMethod->appendChild($indentShortDesc);
            $xmlMethod->appendChild($xmlDesc);
            $xmlMethod->appendChild($indentDesc);

            // Add a static identifier if the method is static.
            if ($method->isStatic()) {
                $this->_addStatic($xmlDesc, $doc);
            }

            /* Save the xml file after adding the whole method node */
            if ($ismethod) {
                echo "M ";
                $topLevel = $doc->getElementsByTagName('methods');

                // If there is no methods section, create one.
                if ($topLevel->length == 0) {
                    $methods = $doc->createElement('methods');
                    $doc->appendChild($methods);
                    $topLevel = $doc->getElementsByTagName('methods');
                }
            } else {
                echo "C ";
                $topLevel = $doc->getElementsByTagName('constructors');

                // If there is no constructor section, create one.
                if ($topLevel->length == 0) {
                    $methods = $doc->createElement('constructors');
                    $doc->appendChild($methods);
                    $topLevel = $doc->getElementsByTagName('constructors');
                }
            }
            $topLevel = $topLevel->item(0);
            echo "Updating " . $daID . "\n";
            $topLevel->appendChild($xmlMethod);
            $topLevel->appendChild($indentMethod);
            $doc->save($file);

            $this->methodCount += 1;
        } else {
            /**
            *   Method exists
            *   @todo Add code to check validity later
            */
            // Grab the element.
            $xmlMethod = $functionNodes->item(0);
            $xmlDesc   = $xmlMethod->getElementsByTagName('desc')->item(0);

            // Add a static entity if needed.
            if ($method->isStatic()) {
                if ($this->_addStatic($xmlDesc, $doc)) {
                    ++$this->methodCount;
                    $doc->save($file);
                }
            }
        }
    }//function updateMethod($classname, file, $sNo, $method, $doc, $xpath)



    /**
    *   Adds a simpara and a static entity to an existing method declaration.
    *
    *   Hackish but working.
    *
    *   @access private
    *   @param  object  $desc The DOMNode for the method description.
    *   @param  object  $doc  The DOMDocument object.
    *   @return boolean true if the method was updated.
    */
    function _addStatic($desc, $doc)
    {
        // Check to see if the static entity has already been added.
        if ($desc->hasChildNodes()) {
            // The DOMDocument translates the entities on loading.
            $staticText = 'This method must be called statically.';

            // Get simparas.
            $list = $desc->getElementsByTagName('simpara');
            for ($i = 0; $i < $list->length; ++$i) {
                $node = $list->item($i);
                if ($node->hasChildNodes()) {
                    // Check for the static text.
                    $child = $node->firstChild;
                    do {
                        if ($child instanceof DOMText &&
                            trim($child->wholeText) == $staticText
                            ) {
                            return false;
                        }
                    } while ($child = $child->nextSibling);
                }
            }
        }

        $desc->appendChild($doc->createTextNode(' '));
        $simpara = $doc->createElement('simpara');
        $simpara->appendChild($doc->createTextNode("\n     "));
        $simpara->appendChild($doc->createEntityReference('static'));
        $simpara->appendChild($doc->createTextNode("\n    "));
        $desc->appendChild($simpara);
        $desc->appendChild($doc->createTextNode("\n   "));
        return true;
    }//function _addStatic($desc, $doc)


    /**
    *   Return methods belonging ONLY to the child.
    *
    *   @param array $cMethods      Array of Reflection Method objects of the class
    *   @param array $pMethods      Array of Reflection Method objects of the class' parent
    */
    function cleanMethods($cMethods, $pMethods)
    {
        $result = array();
        foreach($cMethods as $cMethod) {
            $flag = 1;
            foreach($pMethods as $pMethod) {
                if($cMethod->getName() == $pMethod->getName()) {
                    $flag = 0;
                }
            }
            if($flag) {
                $result[] = $cMethod;
            }
        }
        return $result;
    }//function cleanMethods($cMethods, $pMethods)

}//class UpdateMethods


$doIt = new UpdateMethods();

if ($doIt->methodCount == 0) {
    echo "\n\nNo Methods to Update! Quitting...\n\n";
} else {
    echo "\n\n" . $doIt->methodCount . " methods were updated!";
    if (count($doIt->missingClasses) > 0) {
        echo "\nThe following classes' xml source files do not exist and therefore were NOT updated:\n";
        foreach ($doIt->missingClasses as $missClass) {
            echo $missClass."\n";
        }
    }
}

echo "\n\n";

?>