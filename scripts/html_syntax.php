#!/usr/bin/php -q
<?php
/*
  +----------------------------------------------------------------------+
  | PHP Version 4                                                        |
  +----------------------------------------------------------------------+
  | Copyright (c) 1997-2004 The PHP Group                                |
  +----------------------------------------------------------------------+
  | This source file is subject to version 3.0 of the PHP license,       |
  | that is bundled with this package in the file LICENSE, and is        |
  | available through the world-wide-web at the following url:           |
  | http://www.php.net/license/3_0.txt.                                  |
  | If you did not receive a copy of the PHP license and are unable to   |
  | obtain it through the world-wide-web, please send a note to          |
  | license@php.net so we can mail you a copy immediately.               |
  +----------------------------------------------------------------------+
  | Authors:    Jakub Vr�a <vrana@php.net>                              |
  +----------------------------------------------------------------------+
*/

if ($_SERVER["argc"] < 3) {
	exit("Purpose: Syntax highlight PHP examples in DSSSL generated HTML manual.\n"
		.'Usage: html_syntax.php [ "html" | "php" ] [ filename.ext | dir | wildcard ] ...' ."\n"
		.'"html" - highlight_string() is applied, "php" - highlight_php() is added' ."\n"
	);
}
set_time_limit(5*60); // can run long, but not more than 5 minutes

require 'geshi/geshi.php';
$geshi = new GeSHi($with_tags, 'php', dirname(__FILE__).'/geshi/geshi');
$geshi->set_tab_width(4);
$geshi->enable_classes();
$geshi->set_overall_class('phpcode');
$geshi->set_overall_style('font-size: 85%', true);
$geshi->set_keyword_group_style(1, 'color: #907000; font-weight: bold', true);
$geshi->set_strings_style('color: green', true);
$geshi->set_symbols_highlighting(false);
$geshi->set_numbers_style('color: #aa0000; font-weight: bold', true);
$geshi->set_methods_style('color: black; font-style: italic', true);
$geshi->set_regexps_style(0, 'color: #004090', true);

// use this to get updated stylesheet info if changed via abovementioned API
// $styles = $geshi->get_stylesheet();_

function callback_html_number_entities_decode($matches) {
	return chr($matches[1]);
}

function callback_highlight_php($matches) {
//	$with_tags = preg_replace_callback("!&#([0-9]+);!", "callback_html_number_entities_decode", $matches[1]);
	$with_tags	= trim( html_entity_decode( $matches[1]));
	if ($GLOBALS["TYPE"] == "php") {
		global $geshi;
		$geshi->set_source($with_tags);
		return $geshi->parse_code();
	} else { // "html"
		$bRemoveTags	= false;
		if( substr( $with_tags, 0, 5) != '<' . '?php') {
			$with_tags	= '<' . "?php\r\n" . $with_tags . "\r\n?" . '>';
			$bRemoveTags	= true;
		}
		$with_tags	= highlight_string($with_tags, true);
		if( $bRemoveTags) {
			$with_tags	= str_replace( '&lt;?php', '', $with_tags);
			$with_tags	= str_replace( '?&gt;', '', $with_tags);
		}
		return $with_tags;
	}
}

$files = $_SERVER["argv"];
array_shift($files); // $argv[0] - script filename
$TYPE = array_shift($files); // "html" or "php"
while (($file = array_shift($files)) !== null) {
	if (is_file($file)) {
		$process = array($file);
	} elseif (is_dir($file)) {
		$lastchar = substr($file, -1);
		$process = glob($file . ($lastchar == "/" || $lastchar == "\\" ? "*" : "/*"));
	} else { // should be wildcard
		$process = glob($file);
	}
	foreach ($process as $filename) {
		if (!is_file($filename)) { // do not recurse
			continue;
		}
		echo "highlighting $filename ...\n";
		$original = file_get_contents($filename);
		$highlighted = preg_replace_callback("!<pre class=\"phpcode\">(.*)</pre>!sU", "callback_highlight_php", $original);
		if ($original != $highlighted) {
			// file_put_contents is only in PHP >= 5
			$fp = fopen( $filename, "wb");
			fwrite($fp, $highlighted);
			fclose($fp);
		}
	}
	echo "done highlighting.\n";
}
?>
