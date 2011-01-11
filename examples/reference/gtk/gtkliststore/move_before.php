<?php
$store = new GtkListStore(Gobject::TYPE_STRING, Gobject::TYPE_LONG);

$tokio  = $store->insert(0, array('Tokio', 34100000));
$mexico = $store->insert(1, array('Mexico city', 22650000));
$seoul  = $store->insert(2, array('Seoul', 22250000));

//move Seoul before Mexico
$store->move_before($seoul, $mexico);

//show the list
function echoRow($store, $path, $iter) {
    echo $store->get_value($iter, 0) . "\r\n";
}
$store->foreach('echoRow');
?>
