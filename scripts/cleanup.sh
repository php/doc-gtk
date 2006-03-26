#!/bin/sh
# cleans up a bit
# Note: doesn't clean up the reference (which would be silly)

cd "`dirname "$0"`"

if [ ! -d ../manual ]; then
	echo "Please go to the scripts directory before running this script"
	echo "Usage: cleanup.sh"
	exit 1
fi

rm ../manual/*/chapters.ent
rm manual.xml
