<?php
	// library
	if(!@include(__DIR__ . '/php_lib/simple_html_dom/simple_html_dom.php'))
		include(__DIR__ . '/php_lib/simple_html_dom-patched/simple_html_dom-patched.php');
?>
<?php
	// quiet
	error_reporting(E_ERROR | E_PARSE);

	// choose input data or abort script
	if((isset($argv[1])) && (isset($argv[2])))
	{
		// using in local mode
		$country=$argv[1];
		$location=$argv[2];
	}
	else if((isset($_GET['country'])) && (isset($_GET['location'])))
	{
		// using in remote mode
		$country=$_GET['country'];
		$location=$_GET['location'];
	}
	else
	{
		// fail
		if(!@include(__DIR__ . '/404.php'))
		{
			http_response_code(400);
			echo 'no data';
		}
		exit(1);
	}

	// output as plain text
	header('Content-Type: text/plain');

	// get page and extract table cell
	try
	{
		$input=file_get_html('https://www.timeanddate.com/weather/' . $country . '/' . $location)->find('table#wt-5hr tr.soft td', 0)->plaintext;
	}
	catch(\Throwable $t)
	{
		http_response_code(400);
		echo 'wrong input data - see https://www.timeanddate.com';
		exit(1);
	}

	// fahrenheit or celsius?
	if(strpos($input, '&nbsp;°F') !== false)
		echo round((str_replace('&nbsp;°F', '', $input)-32)/1.8); // convert fahrenheit to celsius
	else
		echo str_replace('&nbsp;°C', '', $input); // input data is in celsius

	exit(0);
?>