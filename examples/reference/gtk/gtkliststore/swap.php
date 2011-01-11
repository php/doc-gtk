<?php
$store = new GtkListStore(Gobject::TYPE_STRING, Gobject::TYPE_LONG);

//insert the rows at different positions
$tokio  = $store->insert(0, array('Tokio', 34100000));
$mexico = $store->insert(1, array('Mexico city', 22650000));

//we swap so that mexico is first
$store->swap($tokio, $mexico);

//show the list
function echoRow($store, $path, $iter) {
    echo $store->get_value($iter, 0) . "\r\n";
}
$store->foreach('echoRow');
?>
