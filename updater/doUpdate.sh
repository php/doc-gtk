#!/bin/sh
path="`dirname "$0"`"
php "$path/prepxpath.php" $@
php "$path/updateMethods.php" $@
php "$path/remxpath.php" $@
