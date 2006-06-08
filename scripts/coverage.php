<?php
/**
*   Documentation coverage analysis generator
*
*   I chose to use a separate xsl file as this seemed to be
*   more easy.
*
*   The script calls the script "gen_manual.sh en coverage"
*   and echoes the generated analysis html.
*
* @author Christian Weiske <cweiske@php.net>
*/
class DocCoverageAnalysis
{
    protected $typestemplate = array(
        'constructors' => array(
            'missing'  => 0,
            'existing' => 0
        ),
        'methods' => array(
            'missing'  => 0,
            'existing' => 0
        ),
        'signals' => array(
            'missing'  => 0,
            'existing' => 0
        ),
        'properties' => array(
            'missing'  => 0,
            'existing' => 0
        ),
        'fields' => array(
            'missing'  => 0,
            'existing' => 0
        ),
    );


    public function run()
    {
        $script = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'gen_manual.sh';
        if (!file_exists($script)) {
            echo "Coverage extractor doesn't exist\n" . $script . "\n";
            exit(1);
        } else if (!is_executable($script)) {
            echo "Coverage extractor is not executable\n" . $script . "\n";
            exit(2);
        }

        $xmlstring = `$script en coverage`;
        $doc = simplexml_load_string($xmlstring);

        $output = <<<EOD
<html>
 <head>
  <title>PHP-Gtk2 documentation coverage analysis</title>
  <style type="text/css">
table {
    border: 1px solid black;
    border-collapse: collapse;
}
td, th {
    border: 1px solid grey;
}
table tr.classset td, table tr.documentation td {
    font-weight:bold;
    border-bottom: 2px solid black;
}
th.allpercent {
    font-size: 200%;
}
  </style>
 </head>
 <body>
  <table>
   <caption>
EOD;
        $output .= 'PHP-Gtk2 documentation coverage analysis of ' . date('Y-m-d H:i:s');
        $output .= <<<EOD
</caption>
EOD;
        $output .= $this->calcCoverage($doc);
        $output .= <<<EOD
  </table>
 </body>
</html>
EOD;
        return $output;
    }//public function run()



    protected function calcCoverage($doc)
    {
        $output = '<thead>' . "\r\n"
            . '<tr>'
            . '<th rowspan="2">Name</th>'
            . '<th colspan="2">Constructors</th>'
            . '<th colspan="2">Methods</th>'
            . '<th colspan="2">Signals</th>'
            . '<th colspan="2">Properties</th>'
            . '<th colspan="2">Fields</th>'
            . '</tr>' . "\r\n"
            . '<tr>'
            . '<th>Done</th><th>All</th>'
            . '<th>Done</th><th>All</th>'
            . '<th>Done</th><th>All</th>'
            . '<th>Done</th><th>All</th>'
            . '<th>Done</th><th>All</th>'
            . '</tr>' . "\r\n"
            . '</thead>' . "\r\n"
            . '<tbody>' . "\r\n";

        $allMissing = 0;
        $allExisting = 0;
        $types = $this->typestemplate;
        foreach ($doc->classset as $classset) {
            list($classoutput, $existing, $missing, $settypes) = $this->calcClassset($classset);
            $types = $this->addTypes($types, $settypes);
            $allMissing += $missing;
            $allExisting += $existing;
            $output .= $classoutput;
        }

        $output .= '<tr class="documentation">'
            . '<th>Documentation</th>'
            . $this->getTypesDisplay($types)
            . '</tr>' . "\r\n";

        $output .= '<tr><th>All in all</th><td colspan="2"></td>'
            . '<th>' . ($allExisting - $allMissing) . '</th>'
            . '<th>' . $allExisting . '</th>'
            . '<th colspan="2"></th>'
            . '<th class="allpercent" colspan="4">'
              . number_format(100 / $allExisting * ($allExisting - $allMissing), 2)
             . '%</th>'
            . '</tr>' . "\r\n"
            . '<tbody>' . "\r\n";

        return $output;
    }//protected function calcCoverage($doc)



    public function calcClassset($classset)
    {
        $output = '';
        $allMissing = 0;
        $allExisting = 0;
        $types = $this->typestemplate;
        foreach ($classset->{'class'} as $class) {
            list($classoutput, $existing, $missing, $classtypes) = $this->calcClass($class);
            $types = $this->addTypes($types, $classtypes);
            $allMissing += $missing;
            $allExisting += $existing;
            $output .= $classoutput;
        }

        $output .= '<tr class="classset">'
            . '<th>' . htmlspecialchars((string)$classset['title']) . '</th>'
            . $this->getTypesDisplay($types)
            . '</tr>' . "\r\n";

        return array($output, $allExisting, $allMissing, $types);
    }



    public function calcClass($class)
    {
        $types = $this->typestemplate;
        $allMissing = 0;
        $allExisting = 0;
        if (isset($class->type)) {
            foreach ($class->type as $type) {
                $title    = (string)$type['title'];
                $types[$title]['missing']  = (string)$type['missing'];
                $types[$title]['existing'] = (string)$type['existing'];
                $allMissing  += $types[$title]['missing'];
                $allExisting += $types[$title]['existing'];
            }
        }

        $output = '<tr><td>' . htmlspecialchars((string)$class['title']) . '</td>'
            . $this->getTypesDisplay($types)
            . '</tr>' . "\r\n";

        return array($output, $allExisting, $allMissing, $types);
    }//public function calcClass($class)



    function getTypesDisplay($types)
    {
        return $this->getTypeDisplay($types['constructors'])
            . $this->getTypeDisplay($types['methods'])
            . $this->getTypeDisplay($types['signals'])
            . $this->getTypeDisplay($types['properties'])
            . $this->getTypeDisplay($types['fields']);
    }//function getTypesDisplay($types)


    function getTypeDisplay($type)
    {
        $existing = $type['existing'];
        $missing  = $type['missing'];
        $done     = $existing - $missing;
        if ($existing != 0) {
            $percent  = intval(100 / $existing * $done);
        } else {
            $percent = -100;
        }

        if ($percent == -100) {
            $color = 'white';
        } else if ($percent == 100) {
            $color = 'green';
        } else if ($percent >= 85) {
            $color = 'yellow';
        } else if ($percent >= 50) {
            $color = 'orange';
        } else {
            $color = 'red';
        }

        $output = '<td style="background-color:' . $color . '">' . $done . '</td>';
        $output .= '<td>' . $existing . '</td>';
        return $output;
    }//function getTypeDisplay($type)



    protected function addTypes($types, $newTypes)
    {
        foreach ($newTypes as $name => $numbers) {
            foreach ($numbers as $numtitle => $number) {
                $types[$name][$numtitle] += $number;
            }
        }
        return $types;
    }//protected function addTypes($types, $newTypes)

}//class DocCoverageAnalysis

$da = new DocCoverageAnalysis();
echo $da->run();
?>