<?php
/**
*  Distributes the generated HTML files in multiple subdirectories
*  so that you can browse them without having to load 1800+ files
*
* subdirs for: atk, gdk, gtk, pango, tutorials
*/

$prefixes = array('atk','gdk', 'glade', 'gtk', 'pango', 'mozembed', 'sourceview', 'tutorials');

if ($GLOBALS['argc'] < 1) {
    exit("Purpose: Distribute the HTML files in the XSLT generated manual.\r\n"
        .'Usage: distribute_html.php [ dest ] ...' ."\r\n");
}
$dest = $GLOBALS['argv'][1];
chdir($dest);

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
            rename($file, $prefix. '/' . $file);
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
    $content = preg_replace($searches, $replacements, file_get_contents($file));
    $hdl = fopen($file, "w+");
    fwrite($hdl,$content);
    fclose($hdl);
}

//prefixed directories
foreach ($prefixes as $prefix) {

    $basefiles = glob($prefix . '/*.html');
    $searches = array('%((img src|href)\s*=\s*("|\'))(?!http|ftp|mailto|\.\.)(\.\/|\/|)%i');
    $replacements = array('\1../');

    foreach ($prefixes as $prefix2) {
        if ($prefix2 != $prefix) {
            $searches[]     = '%href="../'.$prefix2.'\\.%';
            $replacements[] = 'href="../'.$prefix2.'/'.$prefix2.'.';
        } else {
            $searches[]     = '%href="../'.$prefix2.'\\.%';
            $replacements[] = 'href="'.$prefix2.'.';
        }
    }

    foreach ($basefiles as $file) {
        $content = preg_replace($searches, $replacements, file_get_contents($file));
        $hdl = fopen($file, "w+");
        fwrite($hdl,$content);
        fclose($hdl);
    }

}//foreach prefix

?>
