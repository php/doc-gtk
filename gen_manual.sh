#!/bin/sh
#just for testing!

cd "`dirname "$0"`"

if [ $# -lt 2 ]; then
    echo "Usage: ./gen_manual.sh <language> <type>"
    echo "type: html phpweb"
    exit 1
fi

language=$1
type=$2

stylesheetdir=stylesheets
php=php

if [ ! -d manual/$language ]; then
    echo "There is no manual for language $language"
    exit 2
fi

if [ ! -d build ]; then
    mkdir build
fi

if [ ! -d build/$language ]; then
    mkdir build/$language
fi

if [ $type == "html" ]; then
    build_dir=build/$language/html
    xslfile=$stylesheetdir/html/chunk.xsl
elif [ $type == "phpweb" ]; then
    build_dir=build/$language/phpweb
    xslfile=$stylesheetdir/html/phpweb.xsl
else 
    echo "There is no type $type."
    exit 3
fi


if [ ! -d $build_dir ]; then
    mkdir $build_dir
else 
    #empty the dir
    rm -R $build_dir/*
fi

xsltproc --param base.dir "'./$build_dir/'" $xslfile manual/$language/manual.xml

if [ $type == "html" ]; then
    $php -q distribute_html.php $language
fi