<?php
/**
* checks if the "language-defs.ent" files are in sync
*/

//go through all dirs
$hdlDir = opendir( '.');
$arEntities		= array();
$arAllEntities	= array();
while( $strFile = readdir( $hdlDir))
{
	if( is_dir( $strFile) && $strFile[0] != '.') {
		$strFullFile	= $strFile . '/' . 'language-defs.ent';
		if( file_exists( $strFullFile)) {
			$strContents	= file_get_contents( $strFullFile);
			$arMatches		= array();
			preg_match_all( '|<!ENTITY\\s([a-zA-Z0-9]+)|', $strContents, $arMatches);
			$arEntities[$strFullFile]	= $arMatches[1];
			$arAllEntities	= array_merge( $arAllEntities, $arEntities[$strFullFile]);
		}
	}//is_dir
}//while all files

if( count( $arEntities) == 0) {
	echo 'No "language-defs.ent" files were found in subfolders.' . "\r\n";
	echo 'Please run the script in the php-gtk-doc directory' . "\r\n";
	exit( 1);
}

$arAllEntities	= array_unique( $arAllEntities);

//now walk through all files and do a diff
foreach( $arEntities as $strFile => $arFileEntities) {
	$arMissing		= array_diff( $arAllEntities, $arFileEntities);
	if( count( $arMissing) == 0) {
		echo 'ok ' . $strFile . "\r\n";
	} else {
		echo 'missing: ' . implode( ', ' , $arMissing) . ' in ' . $strFile . "\r\n";
	}
}
//echo "check done\r\n";
?>