<?php
// Call DocUpdateTestClassTest::main() if this source file is executed directly.
if (!defined("PHPUnit2_MAIN_METHOD")) {
    define("PHPUnit2_MAIN_METHOD", "DocUpdateTestClassTest::main");
}

require_once "PHPUnit2/Framework/TestCase.php";
require_once "PHPUnit2/Framework/TestSuite.php";

class DocUpdateTestClassTest extends PHPUnit2_Framework_TestCase {

    protected static $tmpFile = '/tmp/DocUpdateTestClass.xml';

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
        passthru('../doUpdate.sh ' . self::$tmpFile);
    }

    /**
     * Tears down the fixture, for example, close a network connection.
     * This method is called after a test is executed.
     *
     * @access protected
     */
    protected function tearDown() {
        unlink(self::$tmpFile);
    }


    function test_simpleadd() {
        readfile(self::$tmpFile);
    }
}


// Call DocUpdateTestClassTest::main() if this source file is executed directly.
if (PHPUnit2_MAIN_METHOD == "DocUpdateTestClassTest::main") {
    DocUpdateTestClassTest::main();
}
?>