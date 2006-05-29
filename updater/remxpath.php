<?php
/**
*   This script removes entity defitions added by prepxpath.php
*/

//remove own filename
array_shift($argv);

$files = $argv;

if (count($files) == 0) {
    echo "Please specify the files to modify\n";
    exit(1);
}

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
    $second = array_shift($arLines);
    if (substr($second, 0, strlen('<!DOCTYPE')) != '<!DOCTYPE') {
        echo 'File "' . $file . "\" has no dtd to remove\n";
        continue;
    }

    do {
        $line = array_shift($arLines);
    } while (trim($line) != ']>');

    file_put_contents($file, $first . implode('', $arLines));
    $modified++;
}

echo 'Modified ' . $modified . " files\n";
?>