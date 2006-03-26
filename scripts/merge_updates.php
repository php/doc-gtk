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
if ($GLOBALS["argc"] != 3) {
    exit("Purpose: Merge pre-formatted contents of new updates file into pre-existing updates file.\r\n"
        .'Usage: merge-updates.php [ newupdatesfile ] [ outfile ] ' ."\r\n"
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
   * Pre-existing updates file; used for output.
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
    function ManualUpdates($newupdates, $outupdates)
    {
        $this->newfile = $newupdates;
        $this->outfile = $outupdates;
        $this->newarray = $this->_getUpdates($this->newfile);
        $this->oldarray = $this->_getUpdates($this->outfile);
    }

  /**
   * Value checking.
   * Picks up file contents.
   * 
   * @param  string filename
   * @return array filecontents
   */
    function _getUpdates($filename)
    {
        if (!is_readable($filename)) {
            trigger_error('Cannot get updates from ' . $filename, E_USER_WARNING);
            trigger_error($filename . ' does not exist or is not readable by this user.', E_USER_ERROR);
            exit;
        }
        return file($filename);
    }

  /**
   * Merges and sorts the arrays without array_intersect_key() or even a useful timestamp <sigh />
   * Rewrite this function when we get PHP 5 and/or `date %s`
   * Sets output array
   * 
   * @param  none
   * @return void
   */
    function mergeUpdates() {
        // We want to show MAX_UPDATES_TO_SHOW or the total of
        // tonight's updates, whichever is the greater. Apparently.
        $this->maximum = max(MAX_UPDATES_TO_SHOW, sizeof($this->newarray));
        $merged = array_merge($this->newarray, $this->oldarray);

        // Lines aren't unique. Titles are...
        foreach ($merged as $line) {
            $stripped = strip_tags($line);
            $titles[] = substr($stripped, strpos($stripped, ' '));
        }

        $unique = array_unique($titles);

        for ($i = 0; $i < sizeof($merged); $i++) {
            if (array_key_exists($i, $unique) && sizeof($this->output) < $this->maximum) {
                $this->output[] = $merged[$i];
            } else {
                unset($merged[$i]);
            }
        }
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
            fwrite($fp, $line);
        }
        fclose($fp);
    }
}

// Set the parameter vars
$newupdates = $argv[1];
$outupdates = $argv[2];

// Create the current list of updates.
$mu =& new ManualUpdates($newupdates, $outupdates);
$mu->mergeUpdates();
$mu->writeUpdatesToFile();

?>
