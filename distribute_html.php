<?php
/**
* distributes the generated html files in multiple subdirectories
*  so that you can browse them without having to load 1800+ files at once
*
* subdirs for: atk, gdk, gtk, pango, tutorials
*/

$prefixes = array('atk','gdk','gtk','pango','tutorials');

if ($GLOBALS['argc'] < 2 || strlen($GLOBALS['argv'][1]) != 2) {
    die("\r\nError: Pass the desired language as only parameter\r\n");
}
$lang = $GLOBALS['argv'][1];

chdir(dirname(__FILE__) . '/build/' . $lang . '/html');

//create directories
foreach ($prefixes as $prefix) {
    if (!file_exists($prefix)) {
        mkdir($prefix, 0755);
    }
}

//move files
$hdl = dir('.');
while (false !== ($file = $hdl->read())) {
    foreach ($prefixes as $prefix) {
        if (substr($file, 0, strlen($prefix) + 1) == $prefix . '.') {
            rename($file, $prefix . '/' . $file);
        }
    }
}

//base directory
$basefiles = glob('*.html');
$searches = array();
$replacements = array();
foreach ($prefixes as $prefix) {
    $searches[]     = '%href="' . $prefix . '\\.%';
    $replacements[] = 'href="' . $prefix . '/' . $prefix . '.';
}
foreach ($basefiles as $file) {
    $content = preg_replace( $searches, $replacements, file_get_contents($file));
    $hdl = fopen($file, "w+");
    fwrite($hdl,$content);
    fclose($hdl);
//    var_dump(preg_replace( $searches, $replacements, file_get_contents($file)));
}


//prefixed directories
foreach ($prefixes as $prefix) {
    $basefiles = glob($prefix . '/*.html');
    $searches       = array('%href="%');
    $replacements   = array('href="../');
    foreach ($prefixes as $prefix2) {
        if ($prefix2 != $prefix) {
            $searches[]     = '%href="../' . $prefix2 . '\\.%';
            $replacements[] = 'href="../' . $prefix2 . '/' . $prefix2 . '.';
        } else {
            $searches[]     = '%href="../' . $prefix2 . '\\.%';
            $replacements[] = 'href="' . $prefix2 . '.';
        }
    }
    $searches[]     = '%href="../http://%';
    $replacements[] = 'href="http://';
    $searches[]     = '%href="../ftp://%';
    $replacements[] = 'href="ftp://';
    $searches[]     = '%href="../mailto:%';
    $replacements[] = 'href="mailto:';
    $searches[]     = '%href="../../%';
    $replacements[] = 'href="../';
    
    foreach ($basefiles as $file) {
        $content = preg_replace( $searches, $replacements, file_get_contents($file));
        $hdl = fopen($file, "w+");
        fwrite($hdl,$content);
        fclose($hdl);
    }
}//foreach prefix


?>