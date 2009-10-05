<?php

/* Copies images to somewhere the various manual builds can 'see' them */

if ($GLOBALS['argc'] < 1) {
    exit("Purpose: Copy images to a local dir for use of the XSLT generated manual.\r\n"
        .'Usage: copy_images.php [ dest ] ...' ."\r\n");
}

$dest = $GLOBALS['argv'][1];
$imagedir = realpath('images');
chdir($dest);

function copy_images($src, $dest, &$count) {
    if (is_dir($src)) {
        if ($handle = opendir($src)) {
            chdir($src);
            while (false !== ($file = readdir($handle))) {
                if ($file != "." && $file != ".." && $file != "CVS" && $file != '.svn') {
                    $fulldest = $dest.substr(getcwd(), strpos(getcwd(), 'images')-1)."/$file";
                    if (is_dir($file)) {
                        if (!file_exists($fulldest))
                            mkdir($fulldest, 0777);
                        copy_images(realpath($file), $dest, $count);
                    } else {
                        copy($file, $fulldest);
                        $count++;
                        echo '>>';
                    }
                }
            }
            chdir("../");
        }
        closedir($handle);
    }
    return $count;
}

/* avoid the file permissions crisis */
mkdir('images', 0777); // explicitly create dest dir at current level
echo "copying image files\n";
$count = 0;
$total = copy_images($imagedir, realpath('.'), $count);
echo "\n$total image files copied\n";

?>
