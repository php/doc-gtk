#!/bin/sh
#generates the php-gtk docs from the sources
#note: the docgen does a chdir to its directory, so the paths have to be relative to php-gtk/generator/
#there are two parameters: "classonly" and "enumonly"

php=php
gen_enum=1
gen_class=1

if [ ! $1 ]; then
	language='en'
else
	language="$1"
fi

if [ ! -d scripts ]; then
	echo "Please run this script from the toplevel php-gtk-doc directory."
	echo "Usage: scripts/gen_docs_from_source.sh [lang][classonly|enumonly]"
	exit 1
fi

if [ ! -d ../php-gtk ];  then
	echo "Please checkout php-gtk first and make sure that"
	echo "the directory ../php-gtk is reachable"
	exit 1
fi

#goto here
cd "`dirname "$0"`"

if [ ! -d ../manual/$language/reference ]; then
	mkdir ../manual
	mkdir ../manual/$language
	mkdir ../manual/$language/reference
	mkdir ../manual/$language/reference/atk
	mkdir ../manual/$language/reference/gdk
	mkdir ../manual/$language/reference/gtk
	mkdir ../manual/$language/reference/pango
fi

if [ $# -gt 1 ]; then
	if [ $2 == "enumonly" ]; then
		gen_class=0
	elif [ $2 == "classonly" ]; then
		gen_enum=0
	fi
fi

#generate the docs
if [ $gen_class -eq 1 ]; then
	echo "Generating class docs"
	$php -q ../../php-gtk/generator/docgen.php -p atk -d ../../php-gtk-doc/manual/$language/reference/atk -s ../../php-gtk-doc/manual/$language/reference/atk ../ext/gtk+/atk.defs
	$php -q ../../php-gtk/generator/docgen.php -p gdk -d ../../php-gtk-doc/manual/$language/reference/gdk -s ../../php-gtk-doc/manual/$language/reference/gdk ../ext/gtk+/gdk.defs
	$php -q ../../php-gtk/generator/docgen.php -p gtk -d ../../php-gtk-doc/manual/$language/reference/gtk -s ../../php-gtk-doc/manual/$language/reference/gtk ../ext/gtk+/gtk.defs
	$php -q ../../php-gtk/generator/docgen.php -p pango -d ../../php-gtk-doc/manual/$language/reference/pango -s ../../php-gtk-doc/manual/$language/reference/pango ../ext/gtk+/pango.defs
fi

#generate enums
if [ $gen_enum -eq 1 ]; then
	echo "Generating enumeration docs"
	$php -q ../../php-gtk/generator/docgen_enum.php atk   manual/$language/reference/atk/atkenum.xml
	$php -q ../../php-gtk/generator/docgen_enum.php gdk   manual/$language/reference/gdk/gdkenum.xml
	$php -q ../../php-gtk/generator/docgen_enum.php gtk   manual/$language/reference/gtk/gtkenum.xml
	$php -q ../../php-gtk/generator/docgen_enum.php pango manual/$language/reference/pango/pangoenum.xml
fi

echo "done"
