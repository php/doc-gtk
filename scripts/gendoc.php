<?php
/**
*   generates a basic documentation from a .defs file
*   written for the php-gtk documentation
*
*   @author Christian Weiske <cweiske@php.net>
*   @date   2004-09-08 20:01
*/

//change this and the $strBase class variable
$strFile    = '/home/cweiske/compilethings/php-gtk/ext/extra/extra.defs';

class DocGenerator
{
    /**
    *   base id
    */
    var $strBase    = 'extra';
    
    /**
    *   which gtk type shall be with which php type
    *   @var    array
    */
    var $arTypeReplacements = array(
        'gboolean'  => 'boolean',
        'gchar'     => 'char',
        'gdouble'   => 'double',
        'gfloat'    => 'float',
        'gint'      => 'int',
        'gpointer'  => '<!-- @fixme: pointer -->',
        'guint'     => 'int',
        'guint16'   => 'int',
        );
        
    /**
    *   helper for the guessClassName function
    *   should be sorted with the longest keys first for proper functionality
    *   @var    array
    */
    var $arFunctionBeginnings   = array(
        'gtk_plot_canvas_'  => 'GtkPlotCanvas',
        'gtk_plot_data_'    => 'GtkPlotData',
        'gtk_plot_axis_'    => 'GtkPlotAxis',
        'gtk_plot_'         => 'GtkPlot',//has to be AFTER gtk_plot_canvas and gtk_plot_data!
        'gtk_sheet_'        => 'GtkSheet',
    
        );
    
    
    /**
    *   displays a debug message (echo)
    *   @param  string  The message
    */
    function debug( $strMessage)
    {
        echo $strMessage . "\r\n";
    }//function debug( $strMessage)
    
    
    
    /**
    *   converts the given type to a nice type
    *   @param  string  The return or parameter type to convert
    *   @return string  The converted parameter type
    */
    function niceType( $strType)
    {
        $strType  = str_replace( '*', '', $strType);
        
        if( substr( $strType, 0, 6) == 'const-') {
            $strType    = substr( $strType, 6);
        }
        
        if( isset( $this->arTypeReplacements[$strType])) {
            $strType    = $this->arTypeReplacements[$strType];
        }
        
        return $strType;
    }//function niceType( $strType)
    
    
    
    /**
    *   tries to guess the classname from a function name
    *   @param  string  The function name from which the class shall be guessed
    *   @return array   The first value is the new function name, the second the class name
    */
    function guessClassName( $strFunctionName)
    {
        foreach( $this->arFunctionBeginnings as $strBeginning => $strClass)
        {
            if( substr( $strFunctionName, 0, strlen( $strBeginning)) == $strBeginning) {
                return array( 
                            substr( $strFunctionName, strlen( $strBeginning)), 
                            $strClass
                       );
            }
        }
        
        //@fixme: Do something like "ends with _new => classname before", do real guessing
        
        return array( $strFunctionName, '<!-- @fixme: no class -->');
    }//function guessClassName( $strFunctionName)
    
    
    
    /**
    *   links a type to be a class name if it seems to be a class
    *   @param  string  The parameter type 
    *   @return string  The parameter type, perhaps surrounded with <classname>
    */
    function linkClass( $strType)
    {
        if( strtolower( $strType[0]) != $strType[0]) {
            //first char was uppercase
            return '<classname>' . $strType . '</classname>';
        }
        return $strType;
    }//function linkClass( $strType)
    
    
    
    /**
    *   generates the documentation for a single enumeration
    *   @param  array   An array of strings which contains all the lines belonging to the enum definition
    *   @return string  The generated documentation part for this single enumeration
    */
    function generateEnum( $arLines)
    {
        $arEnums    = array();
        
        $strName    = '<!-- @fixme: no enumname -->';
        foreach( $arLines as $strLine)
        {
            $strLine    = trim( $strLine);
            $strType    = substr( $strLine, 1, strpos( $strLine, ' ') - 1);
            switch( $strType) {
                case 'c-name':
                    //(c-name GtkPlotCanvasSelection)
                    $nPosBegin  = strpos( $strLine, ' ') + 1;
                    $nPosEnd    = strpos( $strLine, ')');
                    $strName    = substr( $strLine, $nPosBegin, $nPosEnd - $nPosBegin);
                    break;
                case 'value':
                    //(value (name none) (c-name GTK_PLOT_CANVAS_SELECT_NONE))
                    $nPosBegin  = strpos( $strLine, '(c-name ') + 8;
                    $nPosEnd    = strpos( $strLine, ')', $nPosBegin - 1);
                    $arEnums[]  = substr( $strLine, $nPosBegin, $nPosEnd - $nPosBegin);
                    break;
            }
        }//foreach line
        
        $strEnum     = '<enum id="' . $this->strBase . '.enum.' . strtolower( $strName) . '">' . "\r\n";
        $strEnum    .= '<enumname>' . $strName . '</enumname>' . "\r\n";
        $strEnum    .= ' <desc></desc>' . "\r\n";
        foreach( $arEnums as $strEnumOption) 
        {
            $strEnum    .= ' <enumoption>' . "\r\n";
            $strEnum    .= '  <optionname>' . $strEnumOption . '</optionname>' . "\r\n";
            $strEnum    .= '  <shortdesc></shortdesc>' . "\r\n";
            $strEnum    .= ' </enumoption>' . "\r\n";
        }
        $strEnum    .= '</enum>' . "\r\n\r\n";
        
        return array( 'enum', 'enum', $strEnum);
    }//function generateEnum( $arLines)
    
    
    
    /**
    *   generates the documentation for a single function
    *   @param  array   An array of strings which contains all the lines belonging to the function definition
    *   @return string  The generated documentation part for this single function
    */
    function generateFunction( $arLines)
    {
        $arParameter    = array();
        
        $bConstructor   = false;
        
        $strName        = '<!-- @fixme: no function name -->';
        $strClass       = '<!-- @fixme: no classname -->';
        $bFoundClass    = false;
        
        foreach( $arLines as $strLine)
        {
            $strLine    = trim( $strLine);
            $strType    = substr( $strLine, 1, strpos( $strLine, ' ') - 1);
            switch( $strType) {
                case 'function':
                case 'method':
                    //(method GtkPlotFunc3D
                    $nPosBegin  = strpos( $strLine, ' ') + 1;
                    $strName    = substr( $strLine, $nPosBegin);
                    break;
                case 'c-name':
                    //(c-name gtk_plot_canvas_line_set_attributes)
                    $nPosBegin  = strpos( $strLine, '(c-name ') + 8;
                    $nPosEnd    = strpos( $strLine, ')', $nPosBegin - 1);
                    $strCName  = substr( $strLine, $nPosBegin, $nPosEnd - $nPosBegin);
                    if( strpos( $strCName, '_') === false) {
                        //a function name without a 
                        $bConstructor   = true;
                    }
                    break;
                case 'of-object':
                    //(of-object PlotCanvas (Gtk))
                    $nPosBegin  = strpos( $strLine, ' ') + 1;
                    $nPosEnd    = strpos( $strLine, ' ', $nPosBegin);
                    $strClass   = substr( $strLine, $nPosBegin, $nPosEnd - $nPosBegin);
                    $bFoundClass    = true;
                    break;
                case 'return-type':
                    //(return-type gdouble*)
                    $nPosBegin  = strpos( $strLine, '(return-type ') + 13;
                    $nPosEnd    = strpos( $strLine, ')', $nPosBegin - 1);
                    $strReturnType  = substr( $strLine, $nPosBegin, $nPosEnd - $nPosBegin);
                    $strReturnType  = $this->niceType( $strReturnType);
                    break;
                case 'parameter':
                    $arMatches  = array();
                    $strPattern = '/type-and-name\\s+([a-zA-Z0-9\\*-_]+)\s+(?:\\*\\s)?([a-zA-Z0-9-_\\*]+)\\)/';
                    preg_match( $strPattern, $strLine, $arMatches);
                    if( count( $arMatches) == 0) {
                        $this->debug( 'Error generateFunction: parameter doesn\'t match:"' . $strLine . '"');
                    } else {
                        $arParameter[]  = array( 'type' => $this->niceType( $arMatches[1]), 'name' => str_replace( '*', '', $arMatches[2]));
                    }
                    break;
                case 'is-constructor-of':
                    $nPosBegin  = strpos( $strLine, '(is-constructor-of ') + 19;
                    $nPosEnd    = strpos( $strLine, ')', $nPosBegin - 1);
                    $strName    = substr( $strLine, $nPosBegin, $nPosEnd - $nPosBegin);
                    $strClass   = $strName;
                    break;
//                default:
//                    echo $strLine . "\r\n";
//                    break;
            }
        }//foreach line
        
        
        if( !$bFoundClass) {
            //guess the classname from the function name
            list( $strName, $strClass)   = $this->guessClassName( $strName);
        }
                
        if( $strName == 'new' || $strName == 'construct') {
            $bConstructor   = true;
            $strName    = $strClass;
        }
        
        //the first condition is the "<!-- @fixme" case
        if( $strClass[0] == '<' || strtolower( $strClass) == strtolower( $strName)) {
            //a function name without an underscore
            $bConstructor   = true;
            $strClass       = $strName;
        }
        
        //we're done with changing the class
        
        $strIdClass   = strtolower( $strClass);  
        if( substr( $strIdClass, 0, 3) != 'gtk') {
            $strIdClass   = 'gtk' . $strIdClass;
            $strClass     = 'Gtk' . $strClass;
        }
        
  
        
        if( $bConstructor) {
            $strFunc    .= '  <constructor id="' . $this->strBase . '.' . $strIdClass . '.constructor">' . "\r\n";
        } else {
            $strFunc    .= '  <method id="' . $this->strBase . '.' . $strIdClass . '.method.' . strtolower( $strName) . '">' . "\r\n";
        }
        $strFunc    .= '   <funcsynopsis>' . "\r\n";
        $strFunc    .= '    <funcprototype>' . "\r\n";
        $strFunc    .= '     <funcdef>' . $this->linkClass( $strReturnType) . ' <function>' . $strName . '</function></funcdef>' . "\r\n";
        foreach( $arParameter as $arOneParameter) 
        {
            $strFunc    .= '     <paramdef>' . $this->linkClass( $arOneParameter['type']) . ' <parameter>' . $arOneParameter['name'] . '</parameter></paramdef>' . "\r\n";
        }
        $strFunc    .= '    </funcprototype>' . "\r\n";
        $strFunc    .= '   </funcsynopsis>' . "\r\n";
        $strFunc    .= '   <shortdesc>' . "\r\n";
        $strFunc    .= '   </shortdesc>' . "\r\n";
        $strFunc    .= '   <desc>' . "\r\n";
        $strFunc    .= '    <simpara>' . "\r\n";
        $strFunc    .= '    </simpara>' . "\r\n";
        $strFunc    .= '   </desc>' . "\r\n";
        if( $bConstructor) {
            $strFunc    .= '  </constructor>' . "\r\n\r\n";
        } else {
            $strFunc    .= '  </method>' . "\r\n\r\n";
        }
        
        $strType    = 'method';
        if( $bConstructor) {
            $strType    = 'constructor';
        }
        
        return array( $strClass, $strType, $strFunc);
    }//function generateFunction( $arLines)
    
    
    
    /**
    *   @see DocGenerator::generateFunction
    */
    function generateMethod( $arLines)
    {
        return $this->generateFunction( $arLines);
    }//function generateMethod( $arLines)
    
    
    
    /**
    *   saves the results in different files
    *   @param  array Array of the following structure:
    *               arResults
    *                [classname]
    *                   [type] = array()
    *                [classname]
    *                   [type] = array()
    */
    function saveResults( $arResults)
    {
        foreach( $arResults as $strClass => $arClassData)
        {
            if( $strClass == 'enum') {
                $strFileClass   = $this->strBase . 'enum';
            } else {
                $strFileClass   = $strClass;
            }
            $strFilename    = $this->strBase . '.' . strtolower( $strFileClass) . '.xml';
        
            if( $strClass != 'enum') {
                $strFileBegin    = '<?xml version="1.0" encoding="ISO-8859-1" ?>' . "\r\n";
                $strFileBegin   .= '<classentry id="' . $this->strBase . '.' . strtolower( $strClass) . '">' . "\r\n";
                $strFileBegin   .= ' <classmeta>' . "\r\n";
                $strFileBegin   .= '  <classtitle>' . $strClass . '</classtitle>' . "\r\n";
                $strFileBegin   .= '  <classparent><!-- @fixme: class parent --></classparent>' . "\r\n";
                $strFileBegin   .= '  <shortdesc>' . "\r\n";
                $strFileBegin   .= '  </shortdesc>' . "\r\n";  
                $strFileBegin   .= '  <desc>' . "\r\n";
                $strFileBegin   .= '   <simpara>' . "\r\n";
                $strFileBegin   .= '   </simpara>' . "\r\n";
                $strFileBegin   .= '  </desc>' . "\r\n";
                $strFileBegin   .= ' </classmeta>' . "\r\n\r\n";

                $strFileEnd      = '</classentry>' . "\r\n";
            } else {
                $strFileBegin    = '<?xml version="1.0" encoding="ISO-8859-1" ?>' . "\r\n";
                $strFileBegin   .= '<enums id="' . $strFileClass . '">' . "\r\n\r\n";
            
                $strFileEnd      = '</enums>' . "\r\n";
            }
            
            $arContent  = array();//clear it
            foreach( $arClassData as $strType => $arDefinitions)
            {
                switch( $strType) 
                {
                    case 'enum':
                        $arContent['enum']  = implode( $arDefinitions);
                        break;
                    case 'constructor':
                        if( count( $arDefinitions) > 1) {
                            $arContent['constructor']   = ' <!-- @fixme: more than one constructor -->' . "\r\n";
                        }
                        $arContent['constructor']  .= implode( $arDefinitions);
                        break;
                    case 'method':
                        $arContent['method']    = ' <methods>' . "\r\n" . implode( $arDefinitions) . ' </methods>' . "\r\n";
                        break;
                    default:
                        $this->debug( 'saveResults: unknown type "' . $strType . '"');
                        break;
                }
            }//foreach type
            
            /**
            *   save it into the file
            */
            //the content: here you can change the order of the types
            $strContent = $strFileBegin . $arContent['enum'] . $arContent['constructor'] . $arContent['method'] . $strFileEnd;

            //check if the file exists to prevent accidently overwriting
            if( file_exists( $strFilename)) {
                $this->debug( 'Error: the file "' . $strFilename . '" does already exist.');
            } else {
                $hdlFile    = fopen( $strFilename,  'w');
                fwrite( $hdlFile, $strContent);
                fclose( $hdlFile);
                $this->debug( 'written "' . $strFilename . '"');
            }
        }//foreach class
        
        
        $this->debug( 'Don\'t forget to search for "@fixme" in the files!');
    
    }//function saveResults( $arResults)
    
    
    
    /**
    *   parses the file
    *   @return boolean true if all was ok
    */
    function parseFile( $strFile)
    {
        if( !file_exists( $strFile)) {
            $this->debug( 'File "' . $strFile . '" does not exist.');
            return false;
        }
        $arContent  = file( $strFile);
        
        /**
        *   arResults
        *    [classname]
        *       [type] = array()
        *    [classname]
        *       [type] = array()
        */
        $arResults  = array();
        
        $bSomethingInAction = false;
        foreach( $arContent as $strLine)
        {
            if( $strLine[0] == '(') {
                $strType                = substr( $strLine, 1, strpos( $strLine, ' ') - 1);
                $bSomethingInAction     = true;
                $arSubContent           = array();
                $arSubContent[]         = $strLine;
            } else if( $strLine[0] == ')') {
                $strFunction = 'generate' . ucfirst( $strType);
                
                if( method_exists( $this, $strFunction)) {
                    //we know what to do
                    $arData  = $this->$strFunction( $arSubContent);
                    if( $arData !== null) {
                        $arResults[$arData[0]][$arData[1]][] = $arData[2];
                    }
                } else {
                    //$this->debug( 'Error: don\'t know what to do with ' . $strFunction . ' - ' . $strType);
                }
                $bSomethingInAction     = false;
            } else if( $bSomethingInAction) {
                $arSubContent[]         = $strLine;
            }
        
        }//foreach line
        
        
        $this->saveResults( $arResults);
        
        return true;
    }//function parseFile( $strFile)

}//class DocGenerator

$dg = new DocGenerator();
$dg->parseFile( $strFile);
?>