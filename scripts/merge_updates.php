#!/usr/local/bin/php
<?php

/**
 * Class for combining a current list of manual file
 * updates with an existing list.
 *
 * Updated files should be listed as a set of HTML
 * links. The resulting file is an HTML fragment
 * that consists of precisely that, and nothing more.
 *
 * @original author Scott Mattocks
 * @altered by Steph Fox to accommodate XSLT changes
 */

// Check number of args
if ($argc < 3 || $argc > 4) {
    exit("Purpose: Merge pre-formatted contents of new updates file with old updates file.\r\n"
        .'Usage: merge-updates.php <new file> <old file> [ <outfile> ] ' ."\r\n"
    );
}

// Not really max. It can be overridden by
// very busy scribblers: see mergeUpdates()
define ('MAX_UPDATES_TO_SHOW', 15);

class ManualUpdates {

  /**
   * File containing the new update data.
   * @var string
   */
    var $newfile;
  /**
   * Pre-existing updates file; can used for output.
   * @var string
   */
    var $oldfile;

  /**
   * File to use for output.
   * @var string
   */
	var $outfile;

  /**
   * Array that will contain the new update data.
   * @var array
   */
    var $newarray = array();
  /**
   * Array that will contain the current data.
   * @var array
   */
    var $oldarray = array();
  /**
   * Array that will carry the merged info.
   * @var array
   */
    var $output = array();
	var $maximum;

  /**
   * PHP 4 constructor. 
   * Sets files name and content variables
   * 
   * @param  string updatesfile, string outputfile
   * @return void
   */
    function ManualUpdates($newupdates, $oldupdates, $outupdates)
    {
        $this->newfile = $newupdates;
        $this->oldfile = $oldupdates;
        $this->outfile = $outupdates;
        $this->newarray = $this->_getUpdates($this->newfile, 1);
        $this->oldarray = $this->_getUpdates($this->oldfile, 0);
    }

  /**
   * Value checking.
   * Picks up file contents.
   * 
   * @param  string filename
   * @return array filecontents
   */
    function _getUpdates($filename, $new)
    {
        if (!is_readable($filename)) {
            trigger_error('Cannot get updates from ' . $filename, E_USER_WARNING);
            trigger_error($filename . ' does not exist or is not readable by this user.', E_USER_ERROR);
            exit;
        }

		$updates = array();
		$data = file_get_contents($filename);
		preg_match_all('!^.+href="([^"]+)".+date="([^"]+)">([^<]+).*$!m', $data, $match, PREG_SET_ORDER);
		foreach ($match as $m) {
			$updates[$m[1]] = array($m[3], $m[2], $m[0], $new);
		}
		return $updates;
    }

  /**
   * Merges and sorts the updates arrays 
   * Sets output array
   * 
   * @param  none
   * @return void
   */
    function mergeUpdates() {
		$maximum = max(MAX_UPDATES_TO_SHOW, count($this->newarray));
		$this->output = array_merge($this->oldarray, $this->newarray);
		uasort($this->output, array(&$this, 'sortByDate'));
		$this->output = array_slice($this->output, 0, $maximum);
		return;
    }

	function sortByDate($a, $b)
	{
		/* if dates are the same */
		if ((int)$a[1] == (int)$b[1]) {
			/* and 'new' flags are the same */
			if ($a[3] == $b[3]) {
				/* sort by title */
				return strcmp($a[0], $b[0]);
			} else {
				/*
				 * otherwise sort by 'new' flags so that new entries show up at
				 * the top
				 */
				return ($a[3] < $b[3]) ? 1 : -1;
			}
		}

		/* sort by date */
		return ((int)$a[1] < (int)$b[1]) ? 1 : -1;
	}

  /**
   * Writes the updated output array to file, the old-fashioned way
   * 
   * @param  none
   * @return void
   */
    function writeUpdatesToFile()
    {
		$fp = fopen($this->outfile, 'w');

        foreach ($this->output as $line) {
            fwrite($fp, $line[2]."\n");
        }
        fclose($fp);
    }
}

// Set the parameter vars
$newupdates = $argv[1];
$oldupdates = $argv[2];
if ($argc > 3) {
	$outupdates = $argv[3];
} else {
	$outupdates = $oldupdates;
}

// Create the current list of updates.
$mu =& new ManualUpdates($newupdates, $oldupdates, $outupdates);
$mu->mergeUpdates();
$mu->writeUpdatesToFile();

?>
