#!/usr/bin/php -d allow_url_fopen=1
<?php
	// settings
	$debianWiki='https://wiki.debian.org/DebianReleases';

	// library
	if(!@include(__DIR__ . '/../php_lib/simple_html_dom/simple_html_dom.php'))
		include(__DIR__ . '/../php_lib/simple_html_dom-patched/simple_html_dom-patched.php');
?>
<?php
	// functions
	function getDebianEol($debianWiki)
	{
		$returnArray=array();

		$omit=true;
		$returnArrayIndex=0;
		foreach(file_get_html($debianWiki)->find('table')[0]->find('tr') as $tableRow)
			if($omit)
				$omit=false;
			else
			{
				$loopIndex=0;
				foreach($tableRow->find('td') as $tableCell)
				{
					$value=trim($tableCell->plaintext);
					if($value !== '')
					{
						$returnArray[$returnArrayIndex][$loopIndex]=$value;
						++$loopIndex;
					}
				}
				++$returnArrayIndex;
			}

		return $returnArray;
	}
	function checkDebianEol($debianWiki, $debianVersion)
	{
		// return codes:
		// 0 - supported
		// 1 - lts supported
		// 2 - not supported
		// 3 - wrong input data

		// /etc/debian_version has minor version number
		if(strpos($debianVersion, '.') !== false)
			$debianVersion=substr($debianVersion, 0, strpos($debianVersion, '.'));

		$printData=false;
		$dataArray=array();
		foreach(getDebianEol($debianWiki) as $arrayOut)
		{
			foreach($arrayOut as $arrayIn)
				if(($printData) || ($arrayIn === $debianVersion))
				{
					// save data from this table row
					$printData=true;
					array_push($dataArray, $arrayIn);
				}

			// process data from saved table row and send exit code
			if($printData)
			{
				// cache
				if(isset($dataArray[4])) $timestamp_lts_eol=strtotime($dataArray[4]);
				$timestamp_now=strtotime(date('Y-m-d'));

				if($timestamp_now > strtotime($dataArray[3])) // $dataArray[3] -> $timestamp_eol
				{
					echo 'End of life' . PHP_EOL;
					if($timestamp_lts_eol === false)
					{
						echo 'LTS supported' . PHP_EOL;
						return 1;
					}
					else
					{
						if($timestamp_now > $timestamp_lts_eol)
						{
							echo 'LTS support ended' . PHP_EOL;
							return 2;
						}
						else
						{
							echo 'LTS supported' . PHP_EOL;
							return 1;
						}
					}
				}
				else
				{
					echo 'Supported' . PHP_EOL;
					return 0;
				}
			}
		}
		echo 'Version ' . $debianVersion . ' not found' . PHP_EOL;
		return 3;
	}
	function parseDebianEol($debianWiki)
	{
		echo 'Version' . "\t" . 'Code name' . "\t" . 'Release date' . "\t" . 'EOL' . "\t\t" . 'LTS EOL' . "\t\t" . 'ELTS EOL' . PHP_EOL;
		foreach(getDebianEol($debianWiki) as $arrayOut)
		{
			$loopIndex=1;
			foreach($arrayOut as $arrayIn)
			{
				echo $arrayIn . "\t";

				if(count($arrayOut) === 3)
				{
					if($loopIndex === 1) echo "\t\t"; // 0.91 0.93R5 0.93R6
				}
				else
					if($loopIndex === 2) echo "\t"; // Code name<->Release date

				++$loopIndex;
			}
			echo PHP_EOL;
		}
	}
?>
<?php
	// main
	if(isset($argv[1]))
	{
		if(($argv[1] === '--check') && (isset($argv[2])))
			exit(checkDebianEol($debianWiki, $argv[2]));
		if(($argv[1] === '--help') || ($argv[1] === '-h'))
		{
			echo basename(__FILE__) . ' [--check $(cat /etc/debian_version)]' . PHP_EOL;
			exit(0);
		}
	}

	parseDebianEol($debianWiki); // default action
?>