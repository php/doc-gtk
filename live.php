<?php
/**
*	PHP-Gtk2 Livedocs server file
*
*	see liveGen.php for an explanation
*
*	you can call the script with a "debug=1" parameter for 
*	some additional output if you experience problems
*
*	@author Christian Weiske <cweiske@cweiske.de>
*/


class PhpGtkLiveDocs
{
	var $strLang = 'en';
	
	function PhpGtkLiveDocs()
	{
		$id = $this->getId();
		if ($this->genManual($id)) {
			//apache has some problems
			header('Content-Type: text/html; charset=UTF-8');
			echo $this->replaceLinks($this->getGeneratedFileContents($id));
		} else {
			die("Error generating testmanual");
		}
	}//function PhpGtkLiveDocs()
	
	
	
	/**
	*	just returns the base path below which the manual files should be located
	*/
	function getBasePath()
	{
		return 'build/' . $this->strLang . '/test/';
	}//function getBasePath() 
	
	
	
	function getId()
	{
		if (!isset($_GET['id'])) {
			return 'gtk.gtkaboutdialog';
		}
		return $_GET['id'];
	}//function getId()
	
	
	
	function genManual($id)
	{
/*		$hdl = popen('./gen_manual.sh en test ' . $id . ' 2>&1', 'r');
		var_dump(fread($hdl, 2048));
		pclose($hdl);*/
		$retval = shell_exec('./gen_manual.sh en test ' . $id . ' 2>&1');
		if (isset($_GET['debug'])) {
			var_dump(nl2br($retval));
		}
		return true;
	}//function genManual($id)
	
	
	
	function getGeneratedFileContents($id)
	{
		return file_get_contents($this->getFileFromId($id));
	}//function getGeneratedFileContents($id)
	
	
	
	function getFileFromId($id)
	{
		return $this->getBasePath() . $id . '.html';
	}//function getFileFromId($id)
	
	
	
	function replaceLinks($strContent)
	{
		return preg_replace(
			'/href="([^"]+)\\.html(#[^"]+)?"/',
			'href="live.php?id=$1"',
			$strContent
			);
	}//function replaceLinks($strContent)
	
}//class PhpGtkLiveDocs

new PHPGtkLiveDocs();

?>