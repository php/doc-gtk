#!/bin/sh
php prepxpath.php $@
php updateMethods.php $@
php remxpath.php $@
