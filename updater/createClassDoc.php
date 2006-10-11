<?php
/**
for line in `cat missing`; do line2=`echo $line | tr [A-Z] [a-z]`; php createClassDoc.php $line > $line2.xml; done
*/
if ($argc != 2) {
    die('Please specify the classname to create the doc for.' . "\n");
}

$strClass = $argv[1];
preg_match_all('/^([A-Z][a-z]{2,5})[A-Z]/', $strClass, $matches);
if (isset($matches[1][0])) {
    $strPrefix = strtolower($matches[1][0]);
} else {
    $strPrefix = strtolower(substr($strClass, 0, 3));
    echo 'Could not determine prefix for class "' . $strClass . '". Using "' . $strPrefix . "\"\n";
}

try {
    $rClass = new ReflectionClass($strClass);
    $rParent = $rClass->getParentClass();
} catch (Exception $e) {
    die('Class "' . $strClass . '" does not exist.' . "\n");
}

if ($rParent == null) {
    $strParent = '<!-- REMOVE THIS LINE -->';
} else {
    $strParent = $rParent->getName();
}

echo str_replace(array(
    '{CLASSID}',
    '{CLASSNAME}',
    '{CLASSPARENT}'
),array(
    strtolower($strPrefix . '.' . $strClass),
    $strClass,
    $strParent
), file_get_contents(dirname(__FILE__) . '/classdoc.tpl'));

?>