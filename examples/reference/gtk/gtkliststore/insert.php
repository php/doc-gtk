<?php
//Create new store with two columns
$store = new GtkListStore(Gobject::TYPE_STRING, Gobject::TYPE_LONG);

//insert the rows at different positions
$store->insert(1, array('Tokio', 34100000));
$store->insert(0, array('Mexico city', 22650000));

//use the iterator to set the data after insertion
$iter = $store->insert(1);
$store->set($iter, 0, 'Seoul', 1, 22250000);
?>
