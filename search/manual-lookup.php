<?
require_once 'include/manual-lookup.inc';
require 'include/prepend.php';

function make404() {
	commonHeader("404 Not Found");
	$no_path = str_replace("/manual-lookup.php?function=", "", $_SERVER[REQUEST_URI]);
	$no_path = ereg_replace('&[x]=[0-9]&[y]=[0-9]', '', $no_path);
	echo "<br>&nbsp;<H1>Not Found</H1><br>";
	echo "&nbsp;The function <B>" . $no_path . "</B> could not be found.  <a href=$_SERVER[HTTP_REFERER]>Try again</a><br><br><br><br><br><br><br>";
	commonFooter();
}

function multi_choice($file) {
	commonHeader('multiple choice');
	$request = $_GET['function'];
	echo "<br><br>";
	echo "<h1>Which &quot;$request&quot; did you want?</h1>\n";
	echo "<br>";
	for($i = 0; $i < sizeof($file); $i++) {
		$path[$i] = str_replace("/manual/", "", $file[$i]);
		$bits[$i][] = explode(".", $path[$i]);
		foreach($bits[$i] as $piece) {
			for($x = 0; $x < sizeof($piece); $x++) {}
		}

		$GTK = strtoupper($piece[0]);
		$classlink = strtolower($file[$i]);

		if(sizeof($piece) == 5 && $piece[2] == "method")
		echo "<P>&nbsp;$piece[3]() as in the <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[1] $piece[2]</a></B>?</P>";
		elseif(sizeof($piece) == 5 && $piece[2] == "property") {
		$prop = strtolower(substr($piece[1], 3, strlen($piece[1])));
		if(strstr($prop, "event")) $prop = "event";
		echo "<P>&nbsp;\$$prop-&gt;$piece[3] as in the <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[1] $piece[2]</a></B>?</P>";
		}
		elseif(sizeof($piece) == 5)
		echo "<P>&nbsp;&quot;$piece[3]&quot; as in the <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[1] $piece[2]</a></B>?</P>";
		elseif(sizeof($piece) == 4 && $piece[1] == "enum")
		echo "<P>&nbsp;[$piece[2]Value] as in the <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[2] $piece[1]s</a></B>?</P>";
		elseif(sizeof($piece) == 4 && $piece[2] == "constructor")
		echo "<P>&nbsp;$piece[1]() as in the <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[1] $piece[2]</a></B>?</P>";
		elseif(sizeof($piece) == 4)
		echo "<P>&nbsp;$piece[2]() as in the $GTK static function <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[0]::$piece[2]</a></B>?</P>";
		elseif(sizeof($piece) == 3)
		echo "<P>&nbsp;$piece[1] as in the <B><a href = 'http://$_SERVER[HTTP_HOST]$classlink'>$piece[1] class</a></B>?</P>";
	}
	echo "<br><a href=$_SERVER[HTTP_REFERER]>Back</a>";
	commonFooter();
}

$function = strtolower($_GET['function']);

$file = find_manual_page($function);

if(is_array($file)) {
	if(sizeof($file) < 2) {
		$file[0] = strtolower($file[0]);
		header("Location: http://$_SERVER[HTTP_HOST]$file[0]");
		exit;
	}
	multi_choice($file);
	exit;
}

elseif($file  && !is_array($file)) {
	$file = strtolower($file);
	header("Location: http://$_SERVER[HTTP_HOST]$file");
	exit;
}

else {
	make404();
	exit;
}

?>
