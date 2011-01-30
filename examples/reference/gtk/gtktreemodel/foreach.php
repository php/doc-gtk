<?php
$store = new GtkListStore(Gobject::TYPE_STRING, Gobject::TYPE_LONG);

$store->append(array('Tokio', 34100000));
$store->append(array('Mexico city', 22650000));
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