<?php
/**
*	PHP-Gtk manual search function
*	@author	Christian Weiske <cweiske@php.net>
*
*	start this script with "-h" to get the help screen
*	you have to give a parameter from the commandline to ensure 
*		it can be included without problems
*/

/**
*	Manual file conventions
*
*	- sections have own names, subsections are divided with dots -> gtk.gtkselectiondata.method.set.php
*	- method names can have underscores which should be exploded to have own words
*	- reserved words which should not be indexed:
*/

$GLOBALS['php-gtk-doc.phpweb.dir']	= '/data/cvs/php-gtk/php-gtk-doc/build/en/php/';
$GLOBALS['index.file']				= '/data/cvs/php-gtk/scripts/searchindex.dat';

$GLOBALS['sections']				= array( 'gtk', 'gdk', 'extra', 'scn');
$GLOBALS['reserved']				= array( 'gtk', 'gdk', 'scn', 'method', 'property', 'prop', 'enum', 'signal', 'constructor');
$GLOBALS['reserved_method']			= array( 'get', 'set');

/**
*	builds the search index
*	this function should be called once after the manuals have been built
*
*	the index is a serialized array with the search data
*	array
*	[keyword]
*		- [1] priority level 
*			- [file 1]
*			- [file 2]
*		- [2] priority level
*			- [file 1]
*			- [file 2]
*		- [3] priority level
*			- [file 1]
*			- [file 2]
*
*	Priorities:
*	1	class names, tutorial names, ...
*	2	methods, signals, enums
*	3	methods which have the keyword in the class name
*/
function buildIndex()
{
    $hdlDir			= dir( $GLOBALS['php-gtk-doc.phpweb.dir']);
    
    $strClassRegex	= '/^(' . implode( '|', $GLOBALS['sections'] ) . ')\\.[a-z]+$/';
    
    $arIndex		= array();
    
    while( false !== ( $strFile = $hdlDir->read()))
    {
        $strName	= substr( $strFile, 0, -4);
        if( $strName == '') { continue; }// . and ..
        
        if( preg_match( $strClassRegex, $strName)) {
            $nClassPriority	= 1;
        } else {
            $nClassPriority	= 3;
        }
        
        $arPieces	= explode( '.', $strName);
        //remove reserved words
        $arPieces	= array_diff( $arPieces, $GLOBALS['reserved']);
        
        $arNewPieces	= array();
        $nCountWords	= count( $arPieces);
        $nWordPos		= -1;
        foreach( $arPieces as $strWord) 
        {
            $nWordPos++;//the indices do not have constant values (array_diff)
//            echo $nWordPos . ' '  . $nCountWords . ' ' . $strWord . ' ' . $strFile;
            if( $nWordPos == $nCountWords - 1 && $nCountWords > 1) {
//                echo '!!!!!';
                //last word in the filename
                $arNewPieces[2][]				= $strWord;//the word itself
            } else {
                //not the last word in the filename
                $arNewPieces[$nClassPriority][]	= $strWord;//the word itself
            }
            
            $strPrefix		= substr( $strWord, 0, 3);
            if( $strPrefix == 'gtk' || $strPrefix == 'gdk') {
                //classes have gtk or gdk at the beginning, e.g. gtkfixed or gtkoptionmenu
                if( $nWordPos == $nCountWords - 1 && $nCountWords > 1) {
                    $arNewPieces[2][]	= substr( $strWord, 3);
                } else {
                    $arNewPieces[$nClassPriority][]	= substr( $strWord, 3);
                }
            }
//            echo "\r\n";
            
            $arMethodPieces	= explode( '_', $strWord);
            if( count( $arMethodPieces) > 1) 
            {
                //@fixme: including the 'set' in the index could be good if someone searches for "set text"
                $arMethodPieces	= array_diff( $arMethodPieces, $GLOBALS['reserved_method']);
                $arNewPieces[2]	= array_merge( $arNewPieces[2], $arMethodPieces);
                if( count( $arMethodPieces) > 2) 
                {
                    //that we have some partly connections like do_this from do_this_thing
                    foreach( $arMethodPieces as $nId => $strPiece) {
                        if( $nId < count( $arMethodPieces) - 1) {
                            $arNewPieces[2][]	= $strPiece . '_' . $arMethodPieces[$nId + 1];
                        }
                    }
                }
            }
            
        }
//        var_dump( $arNewPieces);
        
        //append the search words to the index array
        foreach( $arNewPieces as $nPriority => $arPriorityPieces) {
            foreach( $arPriorityPieces as $strPiece) {
                $arIndex[$strPiece][$nPriority][]	= $strFile;
            }
        }
        
        //development
        //if( $nCounter++ >= 10) break;
    }
    
    //sort the index | should speed up searching and is nice for debugging
    ksort( $arIndex);
    
//    var_dump( $arIndex);
    
    //save the serialized array
    $hdlFile	= fopen( $GLOBALS['index.file'], 'w');
    fwrite( $hdlFile, serialize( $arIndex));
    fclose( $hdlFile);

    echo 'Search array contains ' . count( $arIndex) . ' keywords' . "\r\n";
}//function buildIndex()



/**
*	Searches for the given string
*	The string is automatically split into substrings with the space char
*/
function search( $strSearch) 
{
    $arSearchWords	= explode( ' ', $strSearch);
    $arIndex		= unserialize( file_get_contents( $GLOBALS['index.file']));
    
    $arResults		= array();
    foreach( $arSearchWords as $strWord) 
    {
        if( isset( $arIndex[ $strWord])) 
        {
            $arFound	= $arIndex[ $strWord];
            foreach( $arFound as $nIndex => $arFiles) 
            {
                foreach( $arFiles as $strFile) 
                {
                    if( isset( $arResults[$nIndex][$strFile])) {
                        $arResults[$nIndex][$strFile]++;
                    } else {
                        $arResults[$nIndex][$strFile] = 1;
                    }
                }
            }
        }
    }
    
    
    //now finish the results into one array
    ksort( $arResults);//that 1 is first
    //@fixme: search files by countfound, but only in the priority class
//var_dump( $arResults);
    $arResultFiles	= array();
    foreach( $arResults as $arWords) {
        foreach( $arWords as $strFile => $nCountFound) {
            $arResultFiles[]	= $strFile;
        }
    }
    
    return $arResultFiles;
}//function search( $strSearch) 



//start something?
if( $GLOBALS['argc'] > 1) 
{ 
    if( $GLOBALS['argv'][1] == '-i' || $GLOBALS['argv'][1] == '--index') {
        buildIndex();
    } else if( $GLOBALS['argv'][1] == '-h' || $GLOBALS['argv'][1] == '--help') {
        echo 'php-gtk manual search' . "\r\n";
        echo 'parameters:' . "\r\n";
        echo ' -i --index           create index file' . "\r\n";
        echo ' -h --help            display this help' . "\r\n";
        echo ' -s --search string   search for the string' . "\r\n";
    } else if( $GLOBALS['argv'][1] == '-s' || $GLOBALS['argv'][1] == '--search') {
        if( !isset( $GLOBALS['argv'][2])) {
            echo 'no search string specified' . "\r\n";
        } else {
            $arFiles	= search( $GLOBALS['argv'][2]);
            echo 'Found ' . count( $arFiles) . ' files matching "' . $GLOBALS['argv'][2] . '"' . "\r\n";
            foreach( $arFiles as $nId => $strFile) {
                echo $nId . ' ' . $strFile . "\r\n";
            }
        }
    }
}//start something

?>