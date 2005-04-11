#!/bin/sh
#generates the php-gtk docs from the sources

language=en

#goto here
cd "`dirname "$0"`"

if [ ! -f manual ]; then
    mkdir manual
    mkdir manual/$language
    mkdir manual/$language/reference
    mkdir manual/$language/reference/atk
    mkdir manual/$language/reference/gdk
    mkdir manual/$language/reference/gtk
    mkdir manual/$language/reference/pango
fi

#generate the docs
php -q ../php-gtk/generator/docgen.php -p atk -d ../../php-gtk-doc/manual/$language/reference/atk -s ../../php-gtk-doc/manual/$language/reference/atk ../ext/gtk+/atk.defs
php -q ../php-gtk/generator/docgen.php -p gdk -d ../../php-gtk-doc/manual/$language/reference/gdk -s ../../php-gtk-doc/manual/$language/reference/gdk ../ext/gtk+/gdk.defs
php -q ../php-gtk/generator/docgen.php -p gtk -d ../../php-gtk-doc/manual/$language/reference/gtk -s ../../php-gtk-doc/manual/$language/reference/gtk ../ext/gtk+/gtk.defs
php -q ../php-gtk/generator/docgen.php -p pango -d ../../php-gtk-doc/manual/$language/reference/pango -s ../../php-gtk-doc/manual/$language/reference/pango ../ext/gtk+/pango.defs

