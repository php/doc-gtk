#!/bin/sh
#checks the manual xml files for well-formedness

#create some temporary directory to play with
tmp=${TMPDIR-/tmp}
tmp=$tmp/checkxml.$RANDOM.$$
(umask 077 && mkdir $tmp) || {
    echo "Could not create temporary directory! Exiting." 1>&2
    exit 1
}

cd "`dirname "$0"`"

echo "Copying manual files to tmp"
cp ../manual/en/reference/gtk/*.xml "$tmp/"
php "prepxpath.php" $tmp/*.xml

echo "Checking files for well-formedness"
for i in $tmp/*.xml
    do xmllint $i --noout
done

echo "Cleaning up"
rm -r $tmp