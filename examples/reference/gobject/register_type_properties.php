<?php
/* Extend GObject or a child of GObject */
class NewType extends GtkLabel {
    /* Define our properties.  The format is property name => array(property type, nick name for the property,
      description of the property, how the property can be accessed, default property value)
      If you use default values, they must match the type assigned to the property
    NOTE: this MUST be PUBLIC - after instatiation php-gtk will unset this property for you, so it will not exist
    in your object after creation */
    public $__gproperties = array(
            'foo' => array(GObject::TYPE_STRING,  'foo property', 'new foo property', GObject::PARAM_READWRITE, 'default foo value'),
            'bar' => array(GObject::TYPE_OBJECT,  'bar property', 'new bar property', GObject::PARAM_READWRITE),
            'zoo' => array(GObject::TYPE_BOOLEAN, 'zoo property', 'new zoo property', GObject::PARAM_READABLE, 0),
            );
    private $foo;
    private $bar;
    private $zoo = 1;

    function __construct()
    {
            parent::__construct();
            $this->foo = 'abcdef';
    }

    function __get_gproperty($spec)
    {
            echo "__get_gproperty called for $spec\n";
            if ($spec->name == 'foo') {
                    return $this->foo;
            } else if ($spec->name == 'bar') {
                    return $this->bar;
            } else if ($spec->name == 'zoo') {
                    return $this->zoo;
            } else {
                    trigger_error('Unknown property');
            }
    }

    function __set_gproperty($spec, $value)
    {
            echo "__set_gproperty called for $spec = $value\n";
            if ($spec->name == 'foo') {
                    $this->foo = $value;
            } else if ($spec->name == 'bar') {
                    $this->bar = $value;
            } else {
                    trigger_error('Unknown property');
            }
    }
}

GObject::register_type('NewType');
echo $c, "\n";
$c = new NewType;
var_dump($c->get_property('foo'));
var_dump($c->get_property('bar'));
var_dump($c->get_property('zoo'));
$c->set_property('bar', new GtkButton());
echo $c->get_property('bar');
echo "\n";

/* Returns:
__get_gproperty called for [GParamString 'foo']
string(6) "abcdef"
__get_gproperty called for [GParamObject 'bar']
NULL
__get_gproperty called for [GParamBoolean 'zoo']
bool(true)
__set_gproperty called for [GParamObject 'bar'] = [GtkButton object (GtkButton Gtk+ type)]
__get_gproperty called for [GParamObject 'bar']
[GtkButton object (GtkButton Gtk+ type)]

*/
?>