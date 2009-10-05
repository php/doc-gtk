<?php
/* Extend GObject or a child of GObject */
class NewType extends GtkButton {
    /* Define our signals.  The format is signal name => array(when to run, return type, array(parameters required))
    NOTE: this MUST be PUBLIC - after instatiation php-gtk will unset this property for you, so it will not exist
    in your object after creation */
    public $__gsignals = array(
            /* override means we are overwriting the default handler provided by gtk for gtkbutton */
            'clicked' => 'override',
            'mashed'  => array(GObject::SIGNAL_RUN_LAST, GObject::TYPE_BOOLEAN, array(GObject::TYPE_LONG, GtkRequisition::gtype)),
            );

    /* any method named ___do_{$signalname} will be considered the default handler for a signal */
    public function __do_clicked() {
        echo "do_clicked called\n";
    }

    function __do_mashed($arg, $arg2) {
            echo "NewType: class closure for `mashed` called with arguments {$arg}, ", get_class($arg2), "\n";
    }
}

/* handler to attach to our new signal */
function my_handler($obj, $arg, $arg2, $ex) {
    echo "my_handler called with args {$arg}, ", get_class($arg2), " and extra {$ex}\n";
    /* This stops bubbling */
    return true;
}

GObject::register_type('NewType');
$c = new NewType;
$r = $c->size_request();
$c->connect('mashed', 'my_handler', 99);
$c->emit('clicked');
var_dump($c->emit('mashed', 42, $r));

/* Returns:
do_clicked called
my_handler called with args 42, GtkRequisition and extra 99
NewType: class closure for `mashed` called with arguments 42, GtkRequisition
bool(false)
*/
?>