<?php
/*  GtkListStore example
 Here we create a list of the largest cities.
 For that we need a list store with two columns:
 The name and the number of inhabitants.
 The "name" is of type "string", and the number
 of inhabitants is of type long (big integer).
*/
$store = new GtkListStore(Gobject::TYPE_STRING, Gobject::TYPE_LONG);

/*
* Using the "set" method
*/

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

//Or, even faster: don't even create an iterator variable
$store->set($store->append(), 0, 'Seoul', 1, 22250000);


/*
* Using "append" to add a row without an iterator
*/
$store->append(array('New York', 21850000));
$store->append(array('São Paulo', 20200000));


/*
* And now show what we've got in the store
*/
function echoRow($store, $path, $iter)
{
    $city   = $store->get_value($iter, 0);
    $number = $store->get_value($iter, 1);
    echo $city . ' has ' . $number . " inhabitants.\r\n";
}
$store->foreach('echoRow');
?>
