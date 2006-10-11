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
*   - beautify output (xml_beautifier?)
*   - add/check signals
*   - add/check properties
*   - write no-<methods> and no-<constructors> testcase
*   - testcase for adding constructor
*
*   Done:
*   - add void if no return value (always since we cannot determine)
*   - add void if no parameters
*   - get rid of those indent* xml nodes
*   - do not include interface methods
*   - interface list
*   - write unit tests
*   - check existing methods
*   - check parameters of already docced methods
*       (void -> parameter, parameter count)
*   - what happens if no <methods> tag exists?
*   - adding constructor: replace __construct name with classname
*
*   @author Anant Narayanan <anant@kix.in>
*   @author Christian Weiske <cweiske@php.net>
*/
class UpdateMethods
{
    /* Stores class under consideration and missing classes */
    public $methodCount     = 0;
    public $missingClasses  = array();



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
            @include_once $classname . '.php';
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
            //also remove interface methods
            foreach ($refObject->getInterfaces() as $refInterface) {
                $parentMethods = array_merge($parentMethods, $refInterface->getMethods());
            }
            $trueMethods   = $this->cleanMethods($childMethods, $parentMethods);
        } else {
            $trueMethods   = $childMethods;
        }

        $arMethodNames = $this->getMethodNames($trueMethods);

        $doc = new DOMDocument();
        if ($doc->load($file)) {
            $xpath = new DOMXPath($doc);

            $nExisting = $xpath->evaluate('count(//methods/method/funcsynopsis/funcprototype/funcdef/function/text())');
            echo ' ' . str_pad(count($trueMethods), 3) . ' methods (' . $nExisting . ' existing)' . "\n";

            $this->checkInterface($doc, $xpath, $refObject);

            //check the existence of each method defined in the docs
            $nRemoved = 0;
            foreach ($xpath->query('//methods/method/funcsynopsis/funcprototype/funcdef/function/text()') as $method) {
                $strMethod = $method->textContent;
                if (!in_array($strMethod, $arMethodNames)) {
                    //method in docs but not in class -> remove it
                    $toRemove = $xpath->query('//methods/method[funcsynopsis/funcprototype/funcdef/function/text()="' . $strMethod . '"]');
                    $toRemoveParent = $xpath->query('//methods');
                    $toRemoveParent->item(0)->removeChild($toRemove->item(0));
                    echo 'M Removing ' . $classname . '::' . $strMethod . "\n";
                    ++$nRemoved;
                }
            }
            if ($nRemoved > 0) {
                $this->methodCount += $nRemoved;
                echo ' Removed ' . $nRemoved . ' methods' . "\n";
            }

            //Update each method in the class
            foreach ($trueMethods as $key => $methodObj) {
                $this->updateMethod($classname, $file, $key, $methodObj, $doc, $xpath);
            }

            if (is_subclass_of($classname, 'GObject')) {
                $this->checkSignals($classname, $doc, $xpath);
            }

            if ($this->methodCount > 0) {
                //something changed? save the thing
                $doc->save($file);
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
    function updateMethod($classname, $file, $sNo, ReflectionMethod $method, DOMDocument $doc, DOMXPath $xpath)
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
        if ($methodName == "__construct") {
            //constructor
            $ismethod = false;
            $daID = $prefix . '.' . $daClass . '.constructor';
        } else if (substr($methodName, 0, 3) == "new") {
            //constructor
            $ismethod = false;
            $daID = $prefix . '.' . $daClass . '.constructor.' . $methodName;
        } else if (substr($methodName, 0, 2) == '__') {
            return;
        } else {
            //normal method
            $ismethod = true;
            $daID = $prefix . '.' . $daClass . '.method.' . $methodName;
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
                $xmlMethod  = $doc->createElement('method', "\n");
            } else {
                $xmlMethod  = $doc->createElement('constructor', "\n");
            }
            $xmlMethod->setAttribute('id', $daID);

            $xmlSynopsis    = $doc->createElement('funcsynopsis', "\n");
            $xmlPrototype   = $doc->createElement('funcprototype', "\n");
            $xmlFuncdef     = $doc->createElement('funcdef', $ismethod ? 'void ' : '');
            if ($methodName == '__construct') {
                $xmlFunction = $doc->createElement('function', $classname);
            } else if ($ismethod) {
                $xmlFunction = $doc->createElement('function', $methodName);
            } else {
                //alternative constructors need Classname::new_* as funcname
                $xmlFunction = $doc->createElement('function', $classname . '::' . $methodName);
            }

            $xmlFuncdef->appendChild($xmlFunction);
            $xmlParamDefs = array();

            if ($totalArgs > 0) {
                /* Function has arguments */
                foreach ($method->getParameters() as $param) {
                    $xmlParamDefs[] = $this->createParameterDefinition($param, $doc);
                }
            } else {
                /* Function has NO arguments */
                $xmlParamDefs[] = $doc->createElement('paramdef', 'void');
            }

            /* Appending child nodes in order */
            $xmlPrototype->appendChild($doc->createTextNode('     '));
            $xmlPrototype->appendChild($xmlFuncdef);
            $xmlPrototype->appendChild($doc->createTextNode("\n"));

            foreach ($xmlParamDefs as $xmlParamdef) {
                $xmlPrototype->appendChild($doc->createTextNode('     '));
                $xmlPrototype->appendChild($xmlParamdef);
                $xmlPrototype->appendChild($doc->createTextNode("\n"));
            }
            $xmlPrototype->appendChild($doc->createTextNode("    "));

            $xmlSynopsis->appendChild($doc->createTextNode('    '));
            $xmlSynopsis->appendChild($xmlPrototype);
            $xmlSynopsis->appendChild($doc->createTextNode("\n   "));

            /* Add nodes for shortdesc and desc */
            $xmlShortDesc = $doc->createElement('shortdesc', "\n    \n   ");
            $xmlDesc      = $doc->createElement('desc', "\n   ");

            $xmlMethod->appendChild($doc->createTextNode("   "));
            $xmlMethod->appendChild($xmlSynopsis);
            $xmlMethod->appendChild($doc->createTextNode("\n"));

            $xmlMethod->appendChild($doc->createTextNode("   "));
            $xmlMethod->appendChild($xmlShortDesc);
            $xmlMethod->appendChild($doc->createTextNode("\n"));

            $xmlMethod->appendChild($doc->createTextNode("   "));
            $xmlMethod->appendChild($xmlDesc);
            $xmlMethod->appendChild($doc->createTextNode("\n"));

            // Add a static identifier if the method is static.
            if ($method->isStatic()) {
                $this->addStatic($doc, $xmlDesc);
            }

            $xmlMethod->appendChild($doc->createTextNode('  '));

            if ($ismethod) {
                echo "M ";
                $topLevels = $doc->getElementsByTagName('methods');

                // If there is no methods section, create one.
                if ($topLevels->length == 0) {
                    $methods        = $doc->createElement('methods');
                    $classentry     = $doc->getElementsByTagName('classentry')->item(0);
                    $classentry->appendChild($doc->createTextNode("\n\n "));
                    $classentry->appendChild($methods);
                    $classentry->appendChild($doc->createTextNode("\n"));
                    $methods->appendChild($doc->createTextNode("\n"));
                    $topLevels       = $doc->getElementsByTagName('methods');
                }
            } else {
                echo "C ";
                $topLevels = $doc->getElementsByTagName('constructors');

                // If there is no constructor section, create one.
                if ($topLevels->length == 0) {
                    $constructors   = $doc->createElement('constructors');
                    $classentry     = $doc->getElementsByTagName('classentry')->item(0);
                    $classentry->appendChild($doc->createTextNode("\n\n "));
                    $classentry->appendChild($constructors);
                    $classentry->appendChild($doc->createTextNode("\n"));
                    $constructors->appendChild($doc->createTextNode("\n"));
                    $topLevels       = $doc->getElementsByTagName('constructors');
                }
            }
            $topLevel = $topLevels->item(0);
            echo "Updating " . $daID . "\n";
            $topLevel->appendChild($doc->createTextNode('  '));
            $topLevel->appendChild($xmlMethod);
            $topLevel->appendChild($doc->createTextNode("\n\n"));

            ++$this->methodCount;
        } else {
            /**
            *   Method exists
            */
            // Grab the element.
            $xmlMethod = $functionNodes->item(0);
            $xmlDesc   = $xmlMethod->getElementsByTagName('desc')->item(0);

            $this->checkExistingMethodParams($doc, $xpath, $method, $path);

            // Add a static entity if needed.
            //only if not a constructor
            if ($ismethod && $method->isStatic()) {
                if ($this->addStatic($doc, $xmlDesc)) {
                    ++$this->methodCount;
                }
            }
        }
    }//function updateMethod($classname, file, $sNo, $method, $doc, $xpath)



    /**
    *   Adds a simpara and a static entity to an existing method declaration.
    *
    *   Hackish but working.
    *
    *   @param  DOMDocument $doc  The DOMDocument object.
    *   @param  DOMNode     $desc The DOMNode for the method description.
    *   @return boolean true if the method was updated.
    */
    function addStatic(DOMDocument $doc, DOMNode $desc)
    {
        // Check to see if the static entity has already been added.
        if ($desc->hasChildNodes()) {
            /**
            *   BAD HACK: This will not work anymore if the
            *   entity changes.
            */
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

        $simpara = $doc->createElement('simpara');
        $simpara->appendChild($doc->createTextNode("\n     "));
        $simpara->appendChild($doc->createEntityReference('static'));
        $simpara->appendChild($doc->createTextNode("\n    "));
        $desc->appendChild($doc->createTextNode(' '));
        $desc->appendChild($simpara);
        $desc->appendChild($doc->createTextNode("\n   "));
        return true;
    }//function addStatic(DOMDocument $doc, DOMNode $desc)



    /**
    *   Checks the existing XML if all parameters exist in there.
    *
    *   @param DOMDocument      $doc        XML document to modify
    *   @param DOMXPath         $xpath      XPath to search with
    *   @param ReflectionMethod $method     Method to get parameter information form
    *   @param string           $path       XPath expression to the method/constructor
    */
    function checkExistingMethodParams(DOMDocument $doc, DOMXPath $xpath, ReflectionMethod $method, $path)
    {
        $strMethod      = $method->getName();
        $nParameters    = $method->getNumberOfParameters();
        $nXmlParameters = $xpath->evaluate('count(' . $path . '/funcsynopsis/funcprototype/paramdef[not(text()="void")])');
        $nVoidParameter = $xpath->evaluate('count(' . $path . '/funcsynopsis/funcprototype/paramdef[text()="void"])');

        $funcdef = $xpath->query($path . '/funcsynopsis/funcprototype')->item(0);

        if ($nParameters == 0) {
            if ($nVoidParameter == 0) {
                //add void
                $funcdef->appendChild($doc->createTextNode(" "));
                $funcdef->appendChild($doc->createElement('paramdef', 'void'));
                $funcdef->appendChild($doc->createTextNode("\n    "));
            } else if ($nXmlParameters > 0) {
                //the method has no parameters but the doc has.
                //very very strange. Do nothing but emit a warning
                echo $strMethod . ' has no parameters, but the docs have. Strange.' . "\n";
            } else {
                return;
            }
        } else {
            /**
            *   Check the existing parameters.
            *   What could be done:
            *   + check number
            *   - check type
            *   - check name
            */
            if ($nVoidParameter) {
                //no void anymore
                $toRemove = $xpath->query($path . '/funcsynopsis/funcprototype/paramdef[text()="void"]');
                $funcdef->removeChild($toRemove->item(0));
            }

            if ($nParameters == $nXmlParameters) {
                //we assume all is ok
                return;
            } else {
                //parameter count does not match
                if ($nXmlParameters > 0) {
                    //remove the existing parameters
                    $toRemove = $xpath->query($path . '/funcsynopsis/funcprototype/paramdef');
                    for ($nA = 0; $nA < $toRemove->length; $nA++) {
                        $funcdef->removeChild($toRemove->item($nA));
                    }
                }
                //Create new paramdefs
                foreach ($method->getParameters() as $parameter) {
                    $funcdef->appendChild($doc->createTextNode(' '));
                    $funcdef->appendChild($this->createParameterDefinition($parameter, $doc));
                    $funcdef->appendChild($doc->createTextNode("\n    "));
                }
            }
        }
    }//function checkExistingMethodParams(DOMDocument $doc, DOMXPath $xpath, ReflectionMethod $method, $path)



    /**
    *   Checks if the interface list matches the class definition
    *
    *   @param DOMDocument  $doc    xml document to modify
    *   @param DOMXPath     $xpath  xpath to search elements with
    *   @param ReflectionClass  $refClass   Class to get the interface list from
    */
    function checkInterface(DOMDocument $doc, DOMXPath $xpath, ReflectionClass $refClass)
    {
        $meta = $doc->getElementsByTagName('classmeta')->item(0);
        $nInterfaces = count($refClass->getInterfaces());

        if ($nInterfaces == 0
            && $xpath->evaluate('count(/classentry/classmeta/implements)') > 0
        ) {
            //remove all interfaces
            foreach ($xpath->query('/classentry/classmeta/implements') as $implements) {
                $meta->removeChild($implements);
            }
        } else if ($nInterfaces > 0) {
            $shortdesc = $xpath->query('/classentry/classmeta/shortdesc')->item(0);

            foreach ($refClass->getInterfaces() as $refInterface) {
                $strInterface = $refInterface->getName();
                if ($xpath->evaluate('count(/classentry/classmeta/implements[text()="' . $strInterface . '"])') == 0) {
                    //add new interface
                    $meta->insertBefore(
                        $doc->createTextNode('  '),
                        $shortdesc
                    );
                    $meta->insertBefore(
                        $doc->createElement('implements', $strInterface),
                        $shortdesc
                    );
                    $meta->insertBefore(
                        $doc->createTextNode("\n"),
                        $shortdesc
                    );
                }
            }
        }
    }//function checkInterface(DOMDocument $doc, DOMXPath $xpath, ReflectionClass $refClass)



    /**
    *   Checks if the class provides signals and if they are
    *   documented. Adds signal doc prototypes.
    *
    *   @param string       $classname  Classname to check
    *   @param DOMDocument  $doc        XML document to modify
    *   @param DOMXPath     $xpath      XPath object to search with
    */
    function checkSignals($classname, DOMDocument $doc, DOMXPath $xpath)
    {

    }//function checkSignals($classname, DOMDocument $doc, DOMXPath $xpath)



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
            $flag = true;
            foreach($pMethods as $pMethod) {
                if($cMethod->getName() == $pMethod->getName()) {
                    $flag = false;
                }
            }
            if($flag) {
                $result[] = $cMethod;
            }
        }
        return $result;
    }//function cleanMethods($cMethods, $pMethods)



    /**
    *   Takes an array of ReflectionMethod objects
    *   and returns an array of strings (method names).
    *
    *   @param array $arMethods     Array of ReflectionMethod objects
    *   @return array               Array of strings (method names)
    */
    function getMethodNames($arMethods)
    {
        $arMethodNames = array();
        foreach ($arMethods as $method) {
            $arMethodNames[] = $method->getName();
        }
        return $arMethodNames;
    }//function getMethodNames($arMethods)



    /**
    *   Creates a <paramdef> parameter definition tag
    *   from the given ReflectionParameter object.
    */
    function createParameterDefinition(ReflectionParameter $param, DOMDocument $doc)
    {
        $xmlParamdef = $doc->createElement('paramdef');
        if ($param->getClass()) {
            /* Parameter is of object type */
            $xmlClassname = $doc->createElement('classname', $param->getClass()->getName());
            $xmlParamdef->appendChild($xmlClassname);
            $xmlParamdef->appendChild($doc->createTextNode(' '));
        }
        $xmlParameter = $doc->createElement('parameter');
        if ($param->isOptional()) {
            //Parameter is optional
            if ($param->isDefaultValueAvailable()) {
                //Parameter has default value
                $xmlOptional =
                    $doc->createElement('optional', $param->getName() . ' = ' . $param->getDefaultValue());
            } else {
                $xmlOptional =
                    $doc->createElement('optional', $param->getName());
            }
            $xmlParameter->appendChild($xmlOptional);
        } else {
            $xmlParameter->nodeValue = $param->getName();
        }
        $xmlParamdef->appendChild($xmlParameter);
        return $xmlParamdef;
    }//function createParameterDefinition(ReflectionParameter $param, DOMDocument $doc)

}//class UpdateMethods


$doIt = new UpdateMethods();

if ($doIt->methodCount == 0) {
    echo "\n\nNo methods to update! Quitting...\n\n";
} else {
    echo "\n\n" . $doIt->methodCount . " methods were updated!";
    if (count($doIt->missingClasses) > 0) {
        echo "\nThe following classes' xml source files do not exist and therefore were NOT updated:\n";
        foreach ($doIt->missingClasses as $missClass) {
            echo $missClass."\n";
        }
    }
}

echo "\n";
?>