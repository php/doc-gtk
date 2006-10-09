<?php
/**
*   Test class for the doc updater
*/
class DocUpdateTestClass extends GtkWidget implements DocUpdateTestInterface, DocUpdateTestInterface2
{
    static $staticProperty = 'staticValue';
    protected $normalProperty = 'normalValue';
    public $propertyWithoutValue;

    public function __construct($a = "b", $c = "d") {}

    function testfunc($param, $optionalparam = "asd", $optionalparam2 = "asd") { }
    function njuFuncNoParams() { }

    function alreadyDocced() {}

    function alreadyDoccedNoVoid() {}

    function alreadyDoccedWrongParams($param1) {}

    function alreadyDoccedWrongParams2($param1, $param2 = "whoa") {}

    public static function staticfunc(GtkNotebook $param1) { }

    function interfaceFunc() {}
    function interfaceFunc2() {}
}

interface DocUpdateTestInterface
{
    function interfaceFunc();
    function interfaceFunc2();
}

interface DocUpdateTestInterface2 {}

?>