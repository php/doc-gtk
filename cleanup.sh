#!/bin/sh
# cleans up a bit
# Note: doesn't clean up the reference (which would be silly)

cd "`dirname "$0"`"

if [ ! -d manual ]; then
    echo "Please go to the php-gtk-doc directory before running this script"
    exit 1
fi

rm -r build/
rm manual/*/chapters.ent
rm manual/*/manual.xml
