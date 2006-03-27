<?php
/**
*   let's see if I can build my own livedocs :)
*
*   @author Christian Weiske <cweiske@cweiske.de>
*
*   == What it does ==
*   The main problem with the php-gtk manual is the size. It has over 2400 functions,
*   signals and properties. This leads to a build time of over 5 minutes, which is
*   far too long to test the recently written function documentation
*
*   So we've got to issues to solve: Keep the build size very short (one or two seconds)
*   and make look the manual as realistic as possible, which means that the original 
*   xsl stylesheets should be used.
*   As we use the original XSL files, we can't simply extract that 
*   one method/signal/property and let xsltproc run over it. We need a complete
*   manual, but this has to be stripped down to the most necessary things:
*   - the method/signal/property itself
*   - predecessor and successor method/signal/property to the one as we
*      want the navigation links to work
*   - all the surrounding tags like <classet>, <book> and so
*
*   All this is done in this php script, and you can see that it works.
*
*
*   FIXME:
*   - links to other functions/methods/enums/... need to be replaced / methods included
*   - extend it to support tutorials and other sections as well
*   - cache generated files, especially the large ones (gtk.functions, gtkwidget)
*/
class PhpGtkLiveDocGenerator
{
    var $arReferencePrefixes    = array('atk', 'gdk', 'gtk', 'pango');
    //relative to manual/en directory
    var $arBookFiles            = array('../reference.xml', '../tutorials.xml');
    var $arChapters = null;

    var $strLang    = 'en';
    var $strTmpFile = 'test_manual.xml';

    var $tpl_manual = null;



    function PhpGtkLiveDocGenerator()
    {
        global $tpl_manual;

        chdir(dirname(__FILE__));
        $this->tpl_manual = $tpl_manual;
        $this->loadChapterents();
    }//function PhpGtkLiveDocGenerator()



    /**
    *	just returns the base path below which the manual files should be located
    */
    function getBasePath()
    {
        return '../manual/' . $this->strLang . '/';
    }//function getBasePath()



    /**
    *	find the file in which $id should be described
    *
    *	@param string	$id		The id for which the manual is built
    *	@return string	The file in which the id should be. NULL if it doesn't exist
    */
    function findFile($id)
    {
        foreach ($this->arReferencePrefixes as $prefix) {
            $preflen = strlen($prefix);
            $dotpos = strpos($id, '.', $preflen + 1);
            if ($dotpos === false) {
                $dotpos = strlen($id);
            }
            if (substr($id, 0, $preflen + 1) == $prefix . '.') {
                //seems it's in the reference
                $part = substr($id, $preflen + 1, $dotpos - $preflen - 1);
                if ($part == 'method' || $part == 'functions') {
                    $part = $prefix . '-functions';
                }
                $file = 'reference/' . $prefix . '/' . $part . '.xml';
                return $file;
            }
        }

        //not found yet...
        foreach ($this->arBookFiles as $strBookFile) {
            $strContent = file_get_contents($this->getBasePath() . $strBookFile);
            if (strpos($strContent, ' id="' . $id . '"') !== false) {
                return $strBookFile;
            }
        }
        return null;
    }//function findFile($id)



    /**
    *	checks if the given file is a special book file
    */
    function isBookFile($strFile)
    {
        return in_array($strFile, $this->arBookFiles);
    }//function isBookFile($strFile)



    /**
    *	find the neighbour files to the given one
    */
    function findNeighbours($file)
    {
        if ($file === null) {
            return null;
        }

        if (substr($file, 0, 10) != 'reference/') {
            return null;
        }

        $fileid = $this->findChapterId($file);
        $arLines = file('../manual/reference.xml');
        $arFiles = array();
        $bFound = false;
        $strPrevious    = null;
        $strNext        = null;
        foreach ($arLines as $nLine => $strLine) {
            $strLine = trim($strLine);
            if ($strLine == '') {
                continue;
            } else if ($strLine[0] == '&') {
                $strId = substr($strLine, 1, -1);
                $strFile = $this->arChapters[$strId];
                $arFiles[] = $strFile;
                if ($strFile == $file) {
                    $bFound = true;
                    $strPrevious = $arFiles[count($arFiles) - 2];
                    continue;
                }
            } else if (substr($strLine, 0, 9) == '<classset') {
                $arFiles[] = 'reference.xml';
            } else {
                continue;
            }

            if ($bFound) {
                $strNext = $arFiles[count($arFiles) - 1];
                break;
            }
        }

        return array($strPrevious, $strNext);
    }//function findNeighbours($file)



    /**
    *	parses the chapterents file and loads it into an array
    */
    function loadChapterents()
    {
        if ($this->arChapters !== null) {
            return;
        }
        $arLines = file($this->getBasePath() . '/../chapters.ent');
        foreach ($arLines as $nLine => $strLine) {
            if ($nLine == 0) { continue; }
            $nSpacePos = strpos($strLine, ' ', 10);
            $strId = substr($strLine, 9, $nSpacePos - 9);
            $strFile = substr($strLine, $nSpacePos + 12, -3);
            $this->arChapters[$strId] = $strFile;
        }
    }//function loadChapterents()



    /**
    *	finds the chapter id to the given filename
    *	e.g. "reference.gtk.gtkaboutdialog" for "reference/gtk/gtkaboutdialog.xml"
    *	uses chapters.ent for lookup
    *
    *	@param	string	$file	The filename to check
    *	@return	string	The chapterid used in chapters.ent
    */
    function findChapterId($file)
    {
        $this->loadChapterents();

        foreach ($this->arChapters as $id => $strFile) {
            if ($strFile == $file) {
                return $id;
            }
        }
        return null;
    }//function findChapterId($file)



    /**
    *	Finds out if the given id in the file is the first or the last id in the given file.
    *	This is necessary as we may need to include the predecessor or 
    *	successor file to have the real manual feeling.
    *	
    *	@param string	$id		The id for which the manual is built
    *	@param string	$file	The filename in which the id should be
    *	@return array	Array with two boolean values: first one tells if $id is the first one, the second if $id is the last id in the file
    */
    function getPositionInfo($id, $file)
    {
        echo $this->getBasePath().$file."\n";
        $arLines = file($this->getBasePath().$file);
        $bFirst = false;
        $bLast = false;
        $nIds = 0;
        $nMyPos = -1;

        foreach ($arLines as $strLine) {
            if (preg_match('/id="[^"]+">/', $strLine)) {
                if (strpos($strLine, 'id="' . $id . '">') !== false) {
                    if ($nIds == 0) {
                        $bFirst = true;
                    }
                    $nMyPos = $nIds + 1;
                }
                $nIds++;
            }
        }

        if ($nMyPos == $nIds) {
            $bLast = true;
        }

        return array($bFirst, $bLast);
    }//function getPositionInfo($id, $file)



    /**
    *	builds the manual file with its contents stripped
    *	down to only have necessary sections for the given id
    *
    *	@param string	$id		The id for which the test manual should be build
    */
    function buildManualFile($id)
    {
        $manual = str_replace('&book;', $this->stripDownBook('reference.xml', $id), $this->tpl_manual);

        $strFile = $this->getBasePath() . $this->strTmpFile;
        echo 'Generating test manual file ' . $strFile . ' ';
        $hdl = fopen($strFile, 'w+');
        fwrite($hdl, $manual);
        fclose($hdl);
        echo 'done' . "\r\n";
    }//function buildManualFile($id)



    /**
    *	strips down the book file (reference.xml, tutorials.xml)
    *	and replaces the required entities
    *
    *	@param string	$bookfile	The book file (like "reference.xml")
    *	@param string	$id			The function id to generate (e.g. "gtk.method.accel_map_load")
    *	@return string	The book's contents
    */
    function stripDownBook($bookfile, $id)
    {
        $file       = $this->findFile($id);

        if ($this->isBookFile($file)) {
            return $this->stripDownBookOverview($bookfile, $id);
        } else {
            return $this->stripDownBookNormal($bookfile, $id, $file);
        }
    }//function stripDownBook($bookfile, $id)



    /**
    *	implements stripping down of book files for *normal* ids,
    *	e.g. classes and class methods
    *	NOT class overviews
    */
    function stripDownBookNormal($bookfile, $id, $file)
    {
        $chapid			= $this->findChapterId($file);

        list($bIsFirst, $bIsLast) = $this->getPositionInfo($id, $file);
        $arNeighbours	= $this->findNeighbours($file);
        $arNeighbourIds	= array(
            $this->findChapterId($arNeighbours[0]),
            $this->findChapterId($arNeighbours[1])
        );

        $arLines = file('../manual/' . $bookfile);
        $strBookContent = '';
        foreach ($arLines as $nLine => $strLine) {
            if (substr($strLine, 0, 3) != '  &') {
                if ($nLine > 0) {
                    $strBookContent .= $strLine;
                }
                continue;
            }
            $strLine2 = trim($strLine);

            $nFileType = 0;
            //the $nFileType = <number> assignments in the if are intended
            if (   ($strLine2 == '&' . $chapid . ';' && ($nFileType = 0) !== false)
                || ($arNeighbourIds[0] !== null && $bIsFirst && $strLine2 == '&' . $arNeighbourIds[0] . ';' && ($nFileType = -1) !== false)
                || ($arNeighbourIds[1] !== null && $bIsLast && $strLine2 == '&' . $arNeighbourIds[1] . ';' && ($nFileType = 1) !== false)
            ) {

                $strBookContent .= $this->getFileContents(substr($strLine2, 1, -1), $id, $nFileType);
            }
        }

        //Fixme: remove empty classsets and such unneeded things

        return $strBookContent;
    }//function stripDownBookNormal($bookfile, $id, $file)



    /**
    *	strips down the book itself and includes all the (stripped down) classes below it
    *	especially reference.xml
    *
    *	@return string	The stripped & extendet book
    */
    function stripDownBookOverview($bookfile, $id)
    {
        $arLines    = file('../manual/' . $bookfile);
        $strBookContent = '';
        $bInIt      = false;
        foreach ($arLines as $nLine => $strLine) {
            $strLine2 = trim($strLine);
            if (substr($strLine, 0, 3) != '  &') {
                if ($nLine > 0) {
                    if ($strLine2 == '<classset id="' . $id . '">') {
                        $bInIt = true;
                    } else if ($bInIt && $strLine2 == '</classset>') {
                        $bInIt = false;
                    }
                    $strBookContent .= $strLine;
                }
                continue;
            }
            if ($bInIt) {
                $strBookContent .= $this->getFileContents(substr($strLine2, 1, -1), $id, 1);
            }
        }

        //Fixme: remove empty classsets and such unneeded things

        return $strBookContent;
    }//function stripDownBookOverview($bookfile, $id)



    /**
    *	loads the file's contents, strips them down to contain only
    *	required ids (top id, function id itself, predecessor and successor functions of the id's function itself)
    *
    *	@param string	$refid		The id which the file in the book (e.g. reference.xml) has
    *	@param string	$id			id of the function to be displayed in live
    *	@param int		$nFileType	0 if its the file itself, -1 if the predecessor, 1 for the successor
    */
    function getFileContents($refid, $id, $nFileType)
    {
        $arContents = file($this->getBasePath() . $this->arChapters[$refid]);

        $strStrippedContents = '';
        $bWaiting = false;//if we are waiting for a closing tag
        $strTag = '';//the tag we wait for
        $nIdNum = 0;//number of current id
        $nIdPos = 0;//position of $id in id array

        if ($nFileType == 0) {
            //we're in the main file of the given id and need the position of the id among all other ids
            $arMatches = array();
            preg_match_all('/ id="([^"]+)"/', implode("\r\n", $arContents), $arMatches);
            unset($arMatches[0]);

            $nMaxId = count($arMatches[1]);
            //find the right position
            foreach ($arMatches[1] as $nThisIdPos => $strThisId) {
                if ($strThisId == $id) {
                    $nIdPos = $nThisIdPos + 1;
                    break;
                }
            }
        } else {
            $nMaxId = substr_count(implode("\r\n", $arContents), ' id="');
        }

        $nEmptyLines = 0;
        foreach ($arContents as $strLine) {
            if (!$bWaiting) {
                //find an id
                $nPos = strpos($strLine, ' id=');
                if ($nPos !== false) {
                    $nIdNum++;
                    if ($nIdNum == 1 
                        || $nIdPos == 1
                        || ($nFileType == -1 && $nIdNum == $nMaxId) 
                        || ($nFileType == 0 && abs($nIdPos - $nIdNum) <= 1)
                    ) {
                        $strStrippedContents .= $strLine;
                    } else {
                        $nPosOpen = strpos($strLine, '<') + 1;
                        $strTag = substr($strLine, $nPosOpen, $nPos - $nPosOpen);
                        $bWaiting = true;
                    }
                } else {
                    if (trim($strLine) == '') {
                        $nEmptyLines++;
                    } else {
                        $nEmptyLines = 0;
                    }
                    //We can't remove all the empty lines because the programlisting examples wouldn't have empty lines then
                    //but they won't have more than 3 empty lines in a row, I hope
                    if ($nEmptyLines < 3 && substr($strLine, 0, 5) != '<?xml') {
                        $strStrippedContents .= $strLine;
                    }
                }
            } else {
                //find closing tag
                if (strpos($strLine, '</' . $strTag . '>') !== false) {
                    $bWaiting = false;
                }
            }
        }
        return $strStrippedContents;
    }//function getFileContents($refid, $nFileType)

}//class PhpGtkLiveDocGenerator

$tpl_manual = <<<EOD
<?xml version='1.0' encoding='utf-8' ?>
<!DOCTYPE book PUBLIC "-//PHP Group//DTD DocBk XML V3.1.7-Based Extension//EN" "../../dbxml/phpgtkdoc.dtd"[
<!ENTITY % language-defs    SYSTEM "language-defs.ent">
%language-defs;
<!ENTITY phpgtk2doc.build-date "PHPGTKLIVEDOCS">
<!ENTITY % global.entities  SYSTEM "../global.ent">
%global.entities;
]>
<set id="phpgtk.docs" lang="en">
 &book;
</set>
EOD;


if (!isset($GLOBALS['liveUnitTest']) || !$GLOBALS['liveUnitTest']) {
    $ld = new PhpGtkLiveDocGenerator();
    if (!isset($argv[1])) {
        die('Pass the ID as parameter' . "\r\n");
    }
    $ld->buildManualFile($argv[1]);
}
?>