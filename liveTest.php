<?php
/**
*	unit tests for the PHP-Gtk2 LiveDocs
*
*	@author Christian Weiske <cweiske@cweiske.de>
*/
require_once 'PHPUnit.php';
$GLOBALS['liveUnitTest'] = true;
require_once('liveGen.php');

class PhpGtkLiveDocGeneratorTest extends PHPUnit_TestCase
{
	var $ld = null;
	
	// constructor of the test suite
	function PhpGtkLiveDocGenerator($name) {
		$this->PHPUnit_TestCase($name);
	}
	
	
	function setUp()
	{
		$this->ld = new PhpGtkLiveDocGenerator();
	}
	
	
	function testFindFile()
	{
		
		$this->assertEquals('reference/gtk/gtkbox.xml', $this->ld->findFile('gtk.gtkbox.method.get_homogeneous'));
		$this->assertEquals('reference/gtk/gtkbox.xml', $this->ld->findFile('gtk.gtkbox'));
	
		$this->assertEquals('reference/gtk/gtk-functions.xml', $this->ld->findFile('gtk.functions'));
		$this->assertEquals('reference/gtk/gtk-functions.xml', $this->ld->findFile('gtk.method.gtk_about_dialog_get_type'));
	
		$this->assertEquals('reference/gtk/gtkbutton.xml', $this->ld->findFile('gtk.gtkbutton.signal.pressed'));
		$this->assertEquals('reference/gtk/gtkwidget.xml', $this->ld->findFile('gtk.gtkwidget.signal.property-notify-event'));
		
		$this->assertEquals('reference/gtk/gtkwidget.xml', $this->ld->findFile('gtk.gtkwidget.property.allocation'));
		
		$this->assertEquals('../reference.xml', $this->ld->findFile('gtkclasses'));
		$this->assertEquals('../reference.xml', $this->ld->findFile('gdkclasses'));
	}
	
	
	
	function testIsBookFile()
	{
		$this->assertTrue($this->ld->isBookFile('../reference.xml'));
		$this->assertTrue($this->ld->isBookFile('../tutorials.xml'));
		
		$this->assertFalse($this->ld->isBookFile('reference/gtk/gtkbox.xml'));
		$this->assertFalse($this->ld->isBookFile('dumptida.xml'));
	}
	
	
	function testLoadChapterents()
	{
		$this->ld->loadChapterents();
		
		$this->assertTrue(isset($this->ld->arChapters['reference.gdk.gdkdevice']));
		$this->assertEquals('reference/gdk/gdkdevice.xml', $this->ld->arChapters['reference.gdk.gdkdevice']);
	}
	
	
	
	function testFindChapterId()
	{
		$this->assertEquals('reference.gtk.gtkcolorselection', $this->ld->findChapterId('reference/gtk/gtkcolorselection.xml'));
	}
	
	
	
	function testFindNeighbours()
	{
		$this->assertEquals(
			array('reference/gtk/gtkbin.xml', 'reference/gtk/gtkbutton.xml'),
			$this->ld->findNeighbours('reference/gtk/gtkbox.xml')
		);
		
		$this->assertEquals(
			array('reference/atk/atkstateset.xml', 'reference.xml'),
			$this->ld->findNeighbours('reference/atk/atkutil.xml')
		);
		
		$this->assertEquals(
			array('reference.xml', 'reference/gdk/gdkcolormap.xml'),
			$this->ld->findNeighbours('reference/gdk/gdk-functions.xml')
		);
	}
	
	
	
	function testGetPositionInfo()
	{
		$this->assertEquals(
			array(true, false),
			$this->ld->getPositionInfo('gtk.functions', $this->ld->findFile('gtk.functions'))
		);
	
		$this->assertEquals(
			array(false, false),
			$this->ld->getPositionInfo('gtk.method.gtk_about_dialog_get_type', $this->ld->findFile('gtk.method.gtk_about_dialog_get_type'))
		);
		
		$this->assertEquals(
			array(false, true),
			$this->ld->getPositionInfo('gtk.method.window_set_default_icon_name', $this->ld->findFile('gtk.method.window_set_default_icon_name'))
		);
	}//function testGetPositionInfo()
	
}//class PhpGtkLiveDocsTest extends PHPUnit_TestCase

$suite  = new PHPUnit_TestSuite( "PhpGtkLiveDocGeneratorTest");
$result = PHPUnit::run( $suite);
echo $result->toString();
?>