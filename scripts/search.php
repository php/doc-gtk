<?php
/**
*   PHP-Gtk manual search function
*   @author Christian Weiske <cweiske@php.net>
*
*   start this script with "-h" to get the help screen
*   you have to give a parameter from the commandline to ensure 
*       it can be included without problems
*
*   How the index works:
*   - Only full words are found. If you search by "wind", "window" will *not* be found.
*   - up to 2 with "_" connected full words are found, e.g. when searching for "this_is", 
*       the file "this_is_a_long_name" will be found, but searching for "this_is_a" will not
*       bring the former result, as only 2 directly connected words are indexed.
*       Note that full method names are indexed, too: "this_is_a_long_name" will be found
*       by searching for "this_is_a_long_name"
*   - The index is prioritized. This means that results are sorted by priority:
*       (Example search: "window")
*       - class names will be first
*           found: gtk.gtkwindow.php, gdk.gdkwindow.php
*       - methods which contain the search word in method name are second
*           found: gdk.gdkdragcontext.property.dest_window.php
*       - methods with the search word not in the direct method name are third
*           found: gdk.gdkwindow.method.lower.php
*
*/

/**
*   Manual file conventions
*
*   - sections have own names, subsections are divided with dots -> gtk.gtkselectiondata.method.set.php
*   - method names can have underscores which should be exploded to have own words
*   - class files have 2 words: section and classname (gtk.gtkwindow.php)
*   - method/signal files have more than 2 words (gtk.gtkwindow.constructor.php, gtk.gtkwindow.method.set:default.php)
*
*/

$GLOBALS['php-gtk-doc.phpweb.dir']  = '/data/cvs/php-gtk/php-gtk-doc/build/en/php/';
$GLOBALS['index.file']              = '/data/cvs/php-gtk/scripts/searchindex.dat';

$GLOBALS['sections']                = array( 'gtk', 'gdk', 'extra', 'scn');
$GLOBALS['reserved']                = array( 'gtk', 'gdk', 'scn', 'method', 'property', 'prop', 'enum', 'signal', 'constructor');
$GLOBALS['reserved_method']         = array( 'get', 'set');

/**
*   builds the search index
*   this function should be called once after the manuals have been built
*
*   the index is a serialized array with the search data
*   array
*   [keyword]
*       - [1] priority level 
*           - [file 1]
*           - [file 2]
*       - [2] priority level
*           - [file 1]
*           - [file 2]
*       - [3] priority level
*           - [file 1]
*           - [file 2]
*
*   Priorities:
*   1   class names, tutorial names, ...
*   2   methods, signals, enums
*   3   methods which have the keyword in the class name
*/
function buildIndex()
{
    $hdlDir         = dir( $GLOBALS['php-gtk-doc.phpweb.dir']);
    
    $strClassRegex  = '/^(' . implode( '|', $GLOBALS['sections'] ) . ')\\.[a-z]+$/';
    
    $arIndex        = array();
    
    while( false !== ( $strFile = $hdlDir->read()))
    {
        $strName    = substr( $strFile, 0, -4);
        if( $strName == '') { continue; }// . and ..
        
        if( preg_match( $strClassRegex, $strName)) {
            $nClassPriority = 1;
        } else {
            $nClassPriority = 3;
        }
        
        $arPieces   = explode( '.', $strName);
        //remove reserved words so that they are not indexed
        //$arPieces   = array_diff( $arPieces, $GLOBALS['reserved']);
        //when uncommenting the last line, change all "$nCountWords > 2" to "$nCountWords > 1"
        
        $arNewPieces    = array();
        $nCountWords    = count( $arPieces);
        $nWordPos       = -1;
        foreach( $arPieces as $strWord) 
        {
            $nWordPos++;//the indices do not have constant values (array_diff)
            if( $nWordPos == $nCountWords - 1 && $nCountWords > 2) {
                //last word in the filename
                $arNewPieces[2][]               = $strWord;//the word itself
            } else {
                //not the last word in the filename
                $arNewPieces[$nClassPriority][] = $strWord;//the word itself
            }
            
            $strPrefix      = substr( $strWord, 0, 3);
            if( $strPrefix == 'gtk' || $strPrefix == 'gdk') {
                //classes have gtk or gdk at the beginning, e.g. gtkfixed or gtkoptionmenu
                if( $nWordPos == $nCountWords - 1 && $nCountWords > 2) {
                    $arNewPieces[2][]   = substr( $strWord, 3);
                } else {
                    $arNewPieces[$nClassPriority][] = substr( $strWord, 3);
                }
            }
            
            $arMethodPieces = explode( '_', $strWord);
            if( count( $arMethodPieces) > 1) 
            {
                //if you want to remove "get" and "set" from the index, uncomment the following line
                //$arMethodPieces = array_diff( $arMethodPieces, $GLOBALS['reserved_method']);
                $arNewPieces[2] = array_merge( $arNewPieces[2], $arMethodPieces);
                if( count( $arMethodPieces) > 2) 
                {
                    //that we have some partly connections like do_this from do_this_thing
                    foreach( $arMethodPieces as $nId => $strPiece) {
                        if( $nId < count( $arMethodPieces) - 1) {
                            $arNewPieces[2][]   = $strPiece . '_' . $arMethodPieces[$nId + 1];
                        }
                    }
                }
            }
            
        }
        
        //append the search words to the index array
        foreach( $arNewPieces as $nPriority => $arPriorityPieces) {
            foreach( $arPriorityPieces as $strPiece) {
                $arIndex[$strPiece][$nPriority][]   = $strFile;
            }
        }
        
        //development
        //if( $nCounter++ >= 10) break;
    }
    
    //sort the index | should speed up searching and is nice for debugging
    ksort( $arIndex);
    
    
    //save the serialized array
    $hdlFile    = fopen( $GLOBALS['index.file'], 'w');
    fwrite( $hdlFile, serialize( $arIndex));
    fclose( $hdlFile);

    echo 'Search array contains ' . count( $arIndex) . ' keywords' . "\r\n";
}//function buildIndex()



/**
*   Searches for the given string
*   The string is automatically split into substrings by the space char
*/
function search( $strSearch) 
{
    $arSearchWords  = explode( ' ', $strSearch);
    $arIndex        = unserialize( file_get_contents( $GLOBALS['index.file']));
    
    $arResults      = array();//all the found files for the indizes
    $arWordsResults = array();//the found files which were found for each word
    foreach( $arSearchWords as $strWord) 
    {
        $arWordsResults[$strWord]   = array();//needs to be done
        if( isset( $arIndex[ $strWord])) 
        {
            $arFound    = $arIndex[ $strWord];
            foreach( $arFound as $nIndex => $arFiles) 
            {
                foreach( $arFiles as $strFile) 
                {
                    $arWordsResults[$strWord][]  = $strFile;
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
    ksort( $arResults);//that key 1 is first
    //@fixme: search files by countfound, but only in the priority class

    $arResultFiles      = array();
    foreach( $arResults as $arWords) {
        foreach( $arWords as $strFile => $nCountFound) {
            $arResultFiles[]    = $strFile;
        }
    }
    
    //remove all the files which were not found for all the words
    //firstly, intersect all the single arrays of the words
    $arAllWords = array();
    $bFirst     = true;
    foreach( $arWordsResults as $strWord => $arWordResults) {
        if( $bFirst) {
            $arAllWords = $arWordResults;
            $bFirst     = false;
        } else {
            $arAllWords = array_intersect( $arAllWords, $arWordResults);
        }
    }
    //now, remove all the files from the $arResultFiles array which are not in the $arAllWords
    //this has to be done to preserve the sorting by classes/methods/...
    $arResultFiles  = array_unique( array_intersect( $arResultFiles, $arAllWords));
    
    $arResultFiles = array_values( $arResultFiles);//that the index begins with 0
    
    return $arResultFiles;
}//function search( $strSearch) 



/**
*   Looks up a given word in the index
*   useful for debugging
*/
function lookup( $strWord, $nNumber = 'all')
{
    $arIndex        = unserialize( file_get_contents( $GLOBALS['index.file']));
    
    if( !isset( $arIndex[$strWord])) {
        echo 'Word "' . $strWord . '" does not exist in index.' . "\r\n";
    } else {
        echo 'Word "' . $strWord . '", section ' . $nNumber . ':' . "\r\n";
        if( $nNumber == 'all') {
            var_dump( $arIndex[$strWord]);
        } else {
            if( !isset( $arIndex[$strWord][$nNumber])) {
                echo 'Section ' . $nNumber . ' of word "' . $strWord . '" does not exist in index.' . "\r\n";
            } else {
                var_dump( $arIndex[$strWord][$nNumber]);
            }
        }
    }
}//function lookup( $strWord) 


//start something?
if( $GLOBALS['argc'] > 1) 
{ 
    if( $GLOBALS['argv'][1] == '-i' || $GLOBALS['argv'][1] == '--index') {
        buildIndex();
    } else if( $GLOBALS['argv'][1] == '-h' || $GLOBALS['argv'][1] == '--help') {
        echo 'php-gtk manual search' . "\r\n";
        echo 'parameters:' . "\r\n";
        echo ' -h --help            display this help' . "\r\n";
        echo ' -i --index           create index file' . "\r\n";
        echo ' -l --lookup          lookup a word in the index' . "\r\n";
        echo ' -s --search string   search for the string' . "\r\n";
    } 
    else if( $GLOBALS['argv'][1] == '-s' || $GLOBALS['argv'][1] == '--search') 
    {
        if( !isset( $GLOBALS['argv'][2])) {
            echo 'no search string specified' . "\r\n";
        } else {
            $arFiles    = search( $GLOBALS['argv'][2]);
            echo 'Found ' . count( $arFiles) . ' files matching "' . $GLOBALS['argv'][2] . '"' . "\r\n";
            foreach( $arFiles as $nId => $strFile) {
                echo $nId . ' ' . $strFile . "\r\n";
            }
        }
    }
    else if( $GLOBALS['argv'][1] == '-l' || $GLOBALS['argv'][1] == '--lookup') 
    {
        if( !isset( $GLOBALS['argv'][2])) {
            echo 'no word specified' . "\r\n";
        } else {
            $nNumber    = isset( $GLOBALS['argv'][3]) ? $GLOBALS['argv'][3] : 'all';
            lookup( $GLOBALS['argv'][2], $nNumber);
        }
    }
}//start something

?>