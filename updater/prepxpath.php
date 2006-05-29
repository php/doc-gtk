<?php
/**
*   This script prepares xml class documentation files
*   for use with updateMethods.php by adding entities
*   definitions used in the manual.
*/
//remove own filename
array_shift($argv);

$files = $argv;

if (count($files) == 0) {
    echo "Please specify the files to modify\n";
    exit(1);
}

$dtdfiles = array(
    //directory.examples and so
    dirname(__FILE__) . '/../manual/global.ent',
    //deprecated.method
    dirname(__FILE__) . '/../manual/en/language-defs.ent',
);

$dtd = "<!DOCTYPE book [\r\n";
foreach ($dtdfiles as $file) {
    $dtd .= file_get_contents($file);
}
$dtd .= "]>\r\n";

$modified = 0;
foreach ($files as $file) {
    if (substr($file, -4) != '.xml') {
        echo '"' . $file . "\" is no xml file\n";
        continue;
    }
    if (!file_exists($file)) {
        echo 'File "' . $file . "\" does not exist\n";
        continue;
    }
    $arLines = file($file);

    //xml header
    $first = array_shift($arLines);
    file_put_contents($file, $first . $dtd . implode('', $arLines));
    $modified++;
}

echo 'Modified ' . $modified . " files\n";
?>