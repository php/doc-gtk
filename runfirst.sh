#!/bin/sh

php="php" 
language="en"

cd "`dirname "$0"`"

$php -q scripts/gen_chapterents.php $language
$php -q scripts/gen_manualxml.php $language

echo ""
echo "Everything is set up for doccing"
echo ""
echo "Now type:"
echo " scripts/gen_manual.sh $language html"
echo "to compile the manual"
