<?php
//Create new store with two columns
$store = new GtkListStore(Gtk::TYPE_STRING, Gtk::TYPE_LONG);

//append one row
$store->append(array('Tokio', 34100000));
//append another row
$store->append(array('Mexico city', 22650000));
?>