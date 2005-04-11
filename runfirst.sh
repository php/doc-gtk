#!/bin/sh
# first time setup

php="php" 
language="en"

cd "`dirname "$0"`"

if [ ! -d ../php-gtk ];  then
    echo "Please checkout php-gtk first and make sure that"
    echo "the directory ../php-gtk is reachable"
    exit 1
fi

./gen_docs_from_source.sh
$php -q gen_chapterents.php $language
$php -q check_chapterusage.php
$php -q gen_manualxml.php $language

echo ""
echo "everything is set up for docc'ing"
echo ""
echo "now you can do:"
echo "  ./gen_manual.sh $language html"
echo "to compile the manual"
