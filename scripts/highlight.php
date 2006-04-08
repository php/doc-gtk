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
  | Authors:    Jakub Vrana <vrana@php.net>                              |
  +----------------------------------------------------------------------+
*/

if ($_SERVER["argc"] < 3) {
    exit("Purpose: Syntax highlight PHP examples in XSLT generated manual.\r\n"
        .'Usage: highlight.php [ "xml" | "php" ] [ filename.ext | dir | wildcard ] ...' ."\r\n"
    );
}
set_time_limit(5*60); // can run long, but not more than 5 minutes
ini_set("error_reporting", E_ALL); // kill the E_STRICT warnings in GeSHi under PHP 5

require dirname(__FILE__).'/geshi/geshi.php';
$geshi = new GeSHi('', 'php', dirname(__FILE__).'/geshi/geshi');
$geshi->set_tab_width(4);
$geshi->set_overall_class('phpcode');
$geshi->set_overall_style('font-size: 85%', true);
$geshi->set_symbols_highlighting(false);

$geshi->set_strings_style('color: green', true);
$geshi->set_keyword_group_style(1, 'color: #d09010; font-weight: bold', true);
$geshi->set_numbers_style('color: #aa0000; font-weight: bold', true);
$geshi->set_methods_style('color: black; font-style: italic', true);
$geshi->set_regexps_style(0, 'color: #004090', true);

// use this to get updated stylesheet info if changed via abovementioned API
// file_put_contents('style.css', $geshi->get_stylesheet());

function callback_html_number_entities_decode($matches) {
    return chr($matches[1]);
}

function callback_highlight_php($matches) {
    $with_tags = trim(html_entity_decode($matches[1]));
    global $geshi;
    $geshi->set_language('php');
	$geshi->set_overall_class('phpcode'); // because last line changes it
    $geshi->enable_classes();
    $geshi->set_source($with_tags);
	return $geshi->parse_code();
}

function callback_highlight_xml($matches) {
    $with_tags = trim(html_entity_decode($matches[1]));
    global $geshi;
    $geshi->set_language('xml');
    $geshi->enable_classes(false);
    $geshi->set_source($with_tags);

    $strCode = $geshi->parse_code();
    return $strCode;
}

echo "Highlighting files..";

$files = $_SERVER["argv"];
array_shift($files);// $argv[0] - script filename
$TYPE = array_shift($files);//"xml" or "php"

while (($file = array_shift($files)) !== null) {

    if (is_file($file)) {
        $process = array($file);
    } elseif (is_dir($file)) {
        $lastchar = substr($file, -1);
        $process = glob($file . ($lastchar == "/" || $lastchar == "\\" ? "*" : "/*"));
    } else { // should be wildcard
        //please tell me how to prevent wildcard escaping in the shell
        $file = str_replace('\\*', '*', $file);
        $process = glob($file);
    }

    foreach ($process as $filename) {
        if (!is_file($filename)) { // do not recurse
            continue;
        }

        $original = file_get_contents($filename);
        $highlighted = preg_replace_callback("!<pre class=\"phpcode\">(.*)</pre>!sU", "callback_highlight_php", $original);
        $highlighted = preg_replace_callback("!<pre class=\"xml\">(.*)</pre>!sU", "callback_highlight_xml", $highlighted);

        if ($original != $highlighted) {
            $fp = fopen( $filename, "wb");
            fwrite($fp, $highlighted);
            fclose($fp);
        }
        echo ".";
    }
}

echo "\nhighlighting complete\n";
?>
