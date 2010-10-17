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
	public $strLang = 'en';
	
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
		return '../build/' . $this->strLang . '/test/';
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
		$strCommand = '../configure && ../scripts/gen_manual.sh en test ' . $id . ' 2>&1';
		$retval = shell_exec($strCommand);
		if (isset($_GET['debug'])) {
            echo 'Executing ' . $strCommand . "<br/>\r\n";
			var_dump(nl2br($retval));
		}
		return true;
	}//function genManual($id)
	
	
	
	function getGeneratedFileContents($id)
	{
        $strFile = $this->getFileFromId($id);
        if (isset($_GET['debug']) || file_exists($strFile)) {
            return file_get_contents($strFile);
        } else {
            return 'File "' . $strFile . '" not found.'
                . ' Probably a problem at manual compilation.'
                . ' Use this script with debug=1" parameter to see the error.';
        }
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