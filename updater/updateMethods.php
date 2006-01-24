<?php

/* Updates docs to newer methods and corrects existing ones.
 *  -Anant
 */

class updateMethods
{
    /* Stores class under consideration and missing classes */
    protected $currentClass;
    public $methodCount=0;
    public $missingClasses = array();
    
    function __construct()
    {   
        /* Get all classes and filter out Gtk classes only */
        $gtkClasses = array();
        $allClasses = get_declared_classes();
        foreach($allClasses as $oneClass) {
            if(substr($oneClass,0,3)=="Gtk") {
                $gtkClasses[] = $oneClass;
            }
        }
        sort($gtkClasses);
        
        /* Check each class, with manual overrides for classes: Gtk
         * and GtkAccessible since they are classes with special parents.
         */
        foreach($gtkClasses as $eachClass) {
            if($eachClass!="Gtk" and $eachClass!="GtkAccessible") {
                $this->currentClass = $eachClass;
                $this->updateClass();
            }
        }
    }

    function updateClass()
    {
        /* Obtain reflection object for current class */
        $refObject = new ReflectionClass($this->currentClass);
        $childMethods = $refObject->getMethods();
        $parent = $refObject->getParentClass();
        if($parent->getName()=="GObject") {
            /* Parent is GObject, skip parents methods
             * Add code later
             */
        }
        else {
            $parentMethods = $parent->getMethods();
            $trueMethods = $this->cleanMethods($childMethods, $parentMethods);
            $classFile = "gtk/".strtolower($this->currentClass).".xml";
            /* Check for manual's xml file */
            if(file_exists($classFile)) {
                $xml = new DOMDocument();
                $xml->load($classFile);
                $xpath = new DOMXPath($xml);
                foreach($trueMethods as $key=>$methodObj) {
                    /* Update each method */
                    $this->updateMethod($key, $methodObj, $xml, $xpath);
                }
            }
            else {
                /* Add to missing classes list */
                $this->missingClasses[] = $this->currentClass;
            }
        }
    }

    function updateMethod($sNo, $method, $doc, $xpath)
    {
        $methodName = $method->getName();
        if(substr($methodName,0,2)=="__" or substr($methodName,0,3)=="new") {
            /* I'll deal with constructors later */
        }
        else {
            $compelArgs = $method->getNumberOfRequiredParameters();
            $totalArgs = $method->getNumberOfParameters();
            
            $daClass = strtolower($this->currentClass);
            $daMethod = strtolower($methodName);
            $daID = 'gtk.'.$daClass.'.method.'.$daMethod;

            $functionNodes =
                $xpath->query('/classentry/methods/method[@id="'.$daID.'"]/funcsynopsis/funcprototype');
            
            if($functionNodes->length==0) {
                /* Method not present, Add it */
                $xmlMethod = $doc->createElement('method', "\n   ");
                $xmlMethod->setAttribute('id', $daID);

                $xmlSynopsis = $doc->createElement('funcsynopsis', "\n    ");
                $xmlPrototype = $doc->createElement('funcprototype', "\n     ");
                $xmlFuncdef = $doc->createElement('funcdef', " ");
                $xmlFunction = $doc->createElement('function', $daMethod);

                $xmlFuncdef->appendChild($xmlFunction);
                
                if($totalArgs > 0) {
                    /* Function has arguments */
                    foreach($method->getParameters() as $param) {
                        $xmlParamdef = $doc->createElement('paramdef');
                        if($param->getClass()) {
                            /* Parameter is of object type */
                            $xmlClassname = $doc->createElement('classname', $param->getClass()->getName());
                            $xmlParamdef->appendChild($xmlClassname);
                        }
                        $xmlParameter = $doc->createElement('parameter');
                        if($param->isOptional()) {
                            /* Parameter is optional */
                            if($param->isDefaultValueAvailable()) {
                                /* Parameter has default value */
                                $xmlOptional = 
                                    $doc->createElement('optional', $param->getName()."=".$param->getDefaultValue());
                            }
                            else {
                                $xmlOptional =
                                    $doc->createElement('optional', $param->getName());
                            }
                            $xmlParameter->appendChild($xmlOptional);
                        }
                        else {
                            $xmlParameter->nodeValue = $param->getName();
                        }
                        $xmlParamdef->appendChild($xmlParameter);
                    }
                }
                else {
                    /* Function has NO arguments */
                    $xmlParamdef = $doc->createElement('paramdef', "void");
                }

                /* Filler nodes to maintain indentation :) */
                $indentFuncdef = $doc->createTextNode("\n      ");
                $indentParamdef = $doc->createTextNode("\n    ");
                $indentPrototype = $doc->createTextNode("\n   ");
                $indentSynopsis = $doc->createTextNode("\n   ");
                $indentShortDesc = $doc->createTextNode("\n  ");
                $indentDesc = $doc->createTextNode("\n  ");
                $indentMethod = $doc->createTextNode("\n  ");
                
                /* Appending child nodes in order */
                $xmlPrototype->appendChild($xmlFuncdef);
                $xmlPrototype->appendChild($indentFuncdef);
                $xmlPrototype->appendChild($xmlParamdef);
                $xmlPrototype->appendChild($indentParamdef);
                $xmlSynopsis->appendChild($xmlPrototype);
                $xmlSynopsis->appendChild($indentPrototype);
                
                /* Add nodes for shortdesc and desc */
                $xmlShortDesc = $doc->createElement('shortdesc', "\n\n   ");
                $xmlDesc = $doc->createElement('desc', "\n\n   ");
                $xmlMethod->appendChild($xmlSynopsis);
                $xmlMethod->appendChild($indentSynopsis);
                $xmlMethod->appendChild($xmlShortDesc);
                $xmlMethod->appendChild($indentShortDesc);
                $xmlMethod->appendChild($xmlDesc);
                $xmlMethod->appendChild($indentDesc);

                /* Save the xml file after adding the whole method node */
                $topLevel = $doc->getElementsByTagName('methods');
                $topLevel = $topLevel->item(0);
                echo "Updating ".$daID."\n";
                $topLevel->appendChild($xmlMethod);
                $topLevel->appendChild($indentMethod);
                $doc->save('gtk/'.strtolower($this->currentClass).'.xml');

                $this->methodCount += 1;
            }
            else {
            /* Method exists
             * Add code to check validity later
             */
            }
        }
    }

    /* Return methods belonging ONLY to the child */
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
    }    
}

$doIt = new updateMethods();

if($doIt->methodCount==0) {
    echo "\n\nNo Methods to Update! Quitting...\n\n";
}
else {
    echo "\n\n".$doIt->methodCount." methods were updated!";
    echo "\nThe following classes' xml source files do not exist and therefore were NOT updated:\n";
    foreach($doIt->missingClasses as $missClass) {
        echo $missClass."\n";
    }
}

echo "\n\n";

?>
