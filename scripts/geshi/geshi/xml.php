<?php
/*************************************************************************************
 * xml.php
 * ---------------
 * Author: Christian Weiske (cweiske@cweiske.de)
 
 * Release Version: 0.0.1
 * CVS Revision Version: $Revision$
 * Date Started: 2004/08/31
 * Last Modified: $Date$
 *
 * XML language file for GeSHi.
 *
 * CHANGES
 * -------
 *
 * TODO (updated 2004/08/31)
 * -------------------------
 * - highlight multiple attributes, not only one
 *
 *************************************************************************************
 *
 *     This file is part of GeSHi.
 *
 *   GeSHi is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   GeSHi is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with GeSHi; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 ************************************************************************************/
$language_data = array (
	'LANG_NAME' => 'XML',
	'COMMENT_SINGLE' => array(),
	'COMMENT_MULTI' => array("<!--" => "-->"),
	'CASE_KEYWORDS' => GESHI_CAPS_NO_CHANGE,
	'QUOTEMARKS' => array("'", '"'),
	'ESCAPE_CHAR' => '&',
	'KEYWORDS' => array(
		1 => array(
			),
		2 => array(
//			'&gt;', '&lt;'
			),
		3 => array(
			'width'
			)
		),
	'SYMBOLS' => array(
//		'&', '<', '>'
		),
	'CASE_SENSITIVE' => array(
		GESHI_COMMENTS => false,
		1 => false,
		2 => false,
		3 => false,
		),
	'STYLES' => array(
		'KEYWORDS' => array(
			1 => 'color: #b1b100;',
			2 => 'color: #040080;',
			3 => 'color: #000066;'
			),
		'COMMENTS' => array(
			'MULTI' => 'color: #11800D; font-weight:normal'
			),
		'ESCAPE_CHAR' => array(
			0 => 'color: #000099; font-weight: bold;'
			),
		'BRACKETS' => array(
			0 => 'color: #66cc66;'
			),
		'STRINGS' => array(
			0 => 'color: #16ABB6;'
			),
		'NUMBERS' => array(
			0 => 'color: #cc66cc;'
			),
		'METHODS' => array(
			0 => 'color: #006600;'
			),
		'SYMBOLS' => array(
			0 => 'color: #66cc66;'
			),
		'SCRIPT' => array(//script delimiters below
			0 => 'color: red;',//doctype
			1 => 'font-weight:bold;',//escaped things: &nbsp;
			2 => 'color: #00A;'//tags
			),
		'REGEXPS' => array(
        	0 => 'color:#AA0;'//attribute
			)
		),
	'OOLANG' => false,
	'OBJECT_SPLITTER' => '',
	'REGEXPS' => array(
        	0 => array( '/((?:&lt;|&lt;\\?){0,1}[a-zA-Z0-9_-]+\\s)([a-zA-Z0-9_-]+)=/', "\\1<|!REG3XP0!>\\2|>="),
		),
	'STRICT_MODE_APPLIES' => GESHI_ALWAYS,
	'SCRIPT_DELIMITERS' => array(
		0 => array(
			'<!DOCTYPE' => '>'
			),
		1 => array(
			'&' => ';'
			),
		2 => array(
			'<' => '>'
			)
	),
	'HIGHLIGHT_STRICT_BLOCK' => array(
		0 => false,
		1 => false,
		2 => true
		)
);

?>