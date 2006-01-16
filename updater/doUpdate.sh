#!/bin/sh
python prepxpath.py
php updateMethods.php
python remxpath.py
