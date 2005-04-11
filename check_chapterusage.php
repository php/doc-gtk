<?php
/**
* Checks if all the single chapters/files defined in manual/en/chapters.ent
* are used somewhere in the manual. Tells you if some is missing
*/

//in which files the entities shall be
$arCheck = array(
	'reference' => 'manual/reference.xml',
	'tutorials' => 'manual/tutorials.xml'
);

//english should be enough as it's the reference manual
$strChapterFile = 'manual/en/chapters.ent';

if (!file_exists($strChapterFile)) {
	die("\r\nThe chapters file " . $strChapterFile . " doesn't exist.\r\nPlease run gen_chapterents.php.\r\n");
}

$strEntities = file_get_contents($strChapterFile);

foreach ($arCheck as $strEntityBeginning => $strFile)
{
	$arMatches = array();
	preg_match_all( '% (' . $strEntityBeginning . '\\.[^ 	]+)%', $strEntities, $arMatches);
	//we need this part of the array only
	$arMatches = $arMatches[1];
	
	if (count($arMatches) == 0) {
		continue;
	}
	
	$strContent = file_get_contents($strFile);
	
	foreach ($arMatches as $strEntityName) {
		if (strpos($strContent, '&' . $strEntityName . ';') === false) {
			echo $strFile . ' doesn\'t use &' . $strEntityName . ";\r\n";
//			echo '  &' . $strEntityName . ";\r\n";
		}
	}

}
?>