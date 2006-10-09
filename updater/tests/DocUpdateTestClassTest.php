<?php
// Call DocUpdateTestClassTest::main() if this source file is executed directly.
if (!defined("PHPUnit2_MAIN_METHOD")) {
    define("PHPUnit2_MAIN_METHOD", "DocUpdateTestClassTest::main");
}

require_once "PHPUnit2/Framework/TestCase.php";
require_once "PHPUnit2/Framework/TestSuite.php";

/**
*   Unit test for the documentation updater.
*   Makes sure it doesn't do anything bad.
*
*   @author Christian Weiske <cweiske@php.net>
*/
class DocUpdateTestClassTest extends PHPUnit2_Framework_TestCase
{

    protected static $tmpFile = '/tmp/DocUpdateTestClass.xml';
    protected $xml            = null;
    protected $xpath          = null;

    public static function main() {
        require_once 'PHPUnit2/TextUI/TestRunner.php';

        $suite  = new PHPUnit2_Framework_TestSuite("DocUpdateTestClassTest");
        $result = PHPUnit2_TextUI_TestRunner::run($suite);
    }

    /**
     * Sets up the fixture, for example, open a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp() {
        chdir(dirname(__FILE__));
        copy('DocUpdateTestClass.xml', self::$tmpFile);
        //we can't do this since we need the entities
//        passthru('../doUpdate.sh ' . self::$tmpFile);
        passthru('php ../prepxpath.php '     . self::$tmpFile);
        passthru('php ../updateMethods.php ' . self::$tmpFile);

        $this->xml = new DOMDocument();
        $this->assertTrue($this->xml->load(self::$tmpFile));
        $this->xpath = new DOMXPath($this->xml);
        $this->assertNotNull($this->xpath);
    }

    /**
     * Tears down the fixture, for example, close a network connection.
     * This method is called after a test is executed.
     *
     * @access protected
     */
    protected function tearDown() {
        passthru('php ../remxpath.php ' . self::$tmpFile);
        //for debugging:
//        readfile(self::$tmpFile);
        unlink(self::$tmpFile);
    }



    /**
    *   Checks if the methods exist in the docs
    *   and have been removed if not in the class.
    */
    function testMethodsExistence()
    {
        //this methods should exist
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.testfunc"]'
            )->length,
            'New method "testfunc" has not been added'
        );
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.njuFuncNoParams"]'
            )->length,
            'New method "njuFuncNoParams" has not been added'
        );
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.staticfunc"]'
            )->length,
            'New method "staticfunc" has not been added'
        );
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.alreadyDocced"]'
            )->length,
            'Method "alreadyDocced" is not there anymore'
        );
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.alreadyDoccedNoVoid"]'
            )->length,
            'Method "alreadyDoccedNoVoid" is not there anymore'
        );
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams"]'
            )->length,
            'Method "alreadyDoccedWrongParams" is not there anymore'
        );
        $this->assertNotEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams2"]'
            )->length,
            'Method "alreadyDoccedWrongParams2" is not there anymore'
        );

        //this methods should not exist
        $this->assertEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.interfacefunc"]'
            )->length,
            'Interface function added.'
        );
        $this->assertEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.interfacefunc2"]'
            )->length,
            'Interfacefunc2 is still there.'
        );
        $this->assertEquals(
            0,
            $this->xpath->query(
                '//method[@id="gtk.docupdatetestclass.method.accelerator_width"]'
            )->length,
            'Non-existing old method still in docs.'
        );
        $this->assertEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.alreadydoccedwrongparams"]'
            )->length,
            'Lowercased method "alreadyDoccedWrongParams" added'
        );
        $this->assertEquals(
            0,
            $this->xpath->query(
                '//method[@id="doc.docupdatetestclass.method.alreadydoccedwrongparams2"]'
            )->length,
            'Lowercased method "alreadyDoccedWrongParams2" added'
        );
    }//function testMethodsExistence()



    /**
    *   Checks if the parameters are ok
    *   in new methods
    */
    function testNewMethodParams()
    {
        $this->assertEquals(
            3,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.testfunc"]'
                . '/funcsynopsis/funcprototype/paramdef[not(text()="void")])'
            )),
            '"testfunc" does not have enough parameters'
        );
        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.njuFuncNoParams"]'
                . '/funcsynopsis/funcprototype/paramdef[text()="void"])'
            )),
            '"njuFuncNoParams" does not have a void parameter'
        );
    }//function testNewMethodParams()



    /**
    *   Checks if the parameters are ok in methods
    *   that have already been documented
    */
    function testExistingMethodParams()
    {
        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedNoVoid"]'
                . '/funcsynopsis/funcprototype/paramdef[text()="void"])'
            )),
            '"alreadyDoccedNoVoid" does not have a void parameter'
        );

        //alreadyDoccedWrongParams
        $this->assertEquals(
            0,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams"]'
                . '/funcsynopsis/funcprototype/paramdef[text()="void"])'
            )),
            '"alreadyDoccedWrongParams" still has a void parameter'
        );
        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams"]'
                . '/funcsynopsis/funcprototype/paramdef[not(text()="void")])'
            )),
            '"alreadyDoccedWrongParams" has no parameter'
        );

        //alreadyDoccedWrongParams2
        $this->assertEquals(
            0,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams2"]'
                . '/funcsynopsis/funcprototype/paramdef[text()="void"])'
            )),
            '"alreadyDoccedWrongParams2" a void parameter'
        );
        $this->assertEquals(
            2,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams2"]'
                . '/funcsynopsis/funcprototype/paramdef[not(text()="void")])'
            )),
            '"alreadyDoccedWrongParams2" does not have 2 parameters'
        );
        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams2"]'
                . '/funcsynopsis/funcprototype/paramdef/parameter[text()="param1"])'
            )),
            '"alreadyDoccedWrongParams2" does not have parameter "param1"'
        );
        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(//method[@id="doc.docupdatetestclass.method.alreadyDoccedWrongParams2"]'
                . '/funcsynopsis/funcprototype/paramdef/parameter/optional[text()="param2 = whoa"])'
            )),
            '"alreadyDoccedWrongParams2" does not have parameter "param2"'
        );

    }//function testExistingMethodParams()



    /**
    *   Check if the <implements> tags are correct.
    */
    function testInterfaceList()
    {
//        readfile(self::$tmpFile);
        $this->assertEquals(
            2,
            intval($this->xpath->evaluate(
                'count(/classentry/classmeta/implements)'
            )),
            'Interface list does not match'
        );

        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(/classentry/classmeta/implements[text()="DocUpdateTestInterface"])'
            )),
            'DocUpdateTestInterface is missing'
        );
        $this->assertEquals(
            1,
            intval($this->xpath->evaluate(
                'count(/classentry/classmeta/implements[text()="DocUpdateTestInterface2"])'
            )),
            'DocUpdateTestInterface2 is missing'
        );
    }//function testInterfaceList()



}//class DocUpdateTestClassTest extends PHPUnit2_Framework_TestCase


// Call DocUpdateTestClassTest::main() if this source file is executed directly.
if (PHPUnit2_MAIN_METHOD == "DocUpdateTestClassTest::main") {
    DocUpdateTestClassTest::main();
}
?>