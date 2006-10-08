<?php
/**
*   Test class for the doc updater
*/
class DocUpdateTestClass extends GtkWidget implements DocUpdateTestInterface
{
    static $staticProperty = 'staticValue';
    protected $normalProperty = 'normalValue';
    public $propertyWithoutValue;

    public function __construct($a = "b", $c = "d") {}

    protected function test($param, $optionalparam = "asd", $optionalparam2 = "asd") { }

    private function privFunc() {}

    public static function staticfunc(GtkNotebook $param1) { }

    function interfaceFunc() {}
}

interface DocUpdateTestInterface
{
    function interfaceFunc();
}

?>