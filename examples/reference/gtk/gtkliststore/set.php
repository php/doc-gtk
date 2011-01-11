<?php
//Create new list store with string and number columns
$store = new GtkListStore(Gobject::TYPE_STRING, Gobject::TYPE_LONG);

//at first, get an iterator for a new row
$iterator = $store->append();
//now use that to set the name at that row (column 0)
$store->set($iterator, 0, 'Tokio');
//same row: set the inhabitants into column 1
$store->set($iterator, 1, 34100000);

//You can set a whole row at once:
$iterator = $store->append();
//we add the data "Mexico city" at column 0 and 
// "22 million" at column 1 at the row $iterator
$store->set($iterator, 0, 'Mexico city', 1, 22650000);

//Even faster: don't even create an iterator variable
$store->set($store->append(), 0, 'Seoul', 1, 22250000);
?>
