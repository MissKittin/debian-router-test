<?php
	// Server admin page - Router modular web admin
	// 3.0 11-13.08.2019
	// 3.1 27-29.09.2019
	// 3.1u1-u2 03.03-23.07.2020
	// this script must be executed first

	// Scripts settings
	$system['location_html']=''; // none if in root directory, for browser
	$system['location_php']=$_SERVER['DOCUMENT_ROOT'] . ''; // for php scripts
	$system['title']='Router'; // <title>
	$system['theme']='dark'; // see lib/htmlheaders/theme.php
	$system['login_theme']='material'; // form, see lib/login-themes
	$system['menu']='default'; // see lib/menu/menu.php
	$system['location_htmlheaders']=$system['location_php'] . '/lib/htmlheaders';
	$router_cache['denied_file_extensions']='sh|rc|TXT'; // regex parameters
	$router_cache['enable_gzip']=false; // enable gzip compression
	$router_cache['http_cache_file_extensions']='png|jpg|jpeg|gif|eot|svg|otf|ttf|woff|woff2|ico'; // regex parameters, 'false' to disable sending cache headers

	/* This script:
		- exports system settings
		- prevents cross-frame scripting
		- compress PHP output
		- deny access to all scripts if 'DISABLED.MAIN' exists
		- hides itself
		- handles 404 file not found error
		- deny access to $router_cache['denied_file_extensions'] files
		- preventing access to module if index.php is in URI
		- deny access to files: 'disabled', 'description.php' and 'menu-addon.php'
		- deny access to disabled modules
		- deny access to lib/htmlheaders.php, cache_htmlheaders.php, lib/htmlheaders/* and lib/htmlheaders_min/*
		- sends cache headers to the browser for $router_cache['http_cache_file_extensions'] files
	*/

	// prevent cross-frame scripting
	header('X-Frame-Options: DENY');

	// start gzip handler
	if($router_cache['enable_gzip']) if(pathinfo($_SERVER['SCRIPT_NAME'], PATHINFO_EXTENSION) === 'php') ob_start('ob_gzhandler');

	// disable switch
	if((file_exists($system['location_php'] . '/DISABLED.MAIN')) && ($_SERVER['REMOTE_ADDR'] != '127.0.0.1'))
	{
		echo '<!DOCTYPE html>
			<html>
				<head>
					<title>'.$system['title'].'</title>
					<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<style>
						body {
							color: #ffffff;
							background-color: #000000;
						}
						h1 {
							position: fixed;
							top: 45%;
							left: 45%;
							text-align: center;
						}
						@media only screen and (max-width: 850px) {
							h1 {
								left: 35%;
							}
						}
					</style>
				</head>
				<body>
					<h1>Disabled</h1>
				</body>
			</html>
		';
		exit();
	}

	// now cache some commands to quick exec
	$router_cache['strtok']=strtok($_SERVER['REQUEST_URI'], '?');
	$router_cache['substr']=substr($router_cache['strtok'], strrpos($router_cache['strtok'], '/') + 1);

	// new explode function
	$router_cache['explode']=function($a, $b, $offset)
	{
		$array=explode($a, $b);
		if(isset($array[$offset]))
			return $array[$offset];
		return false;
	};

	// hide this script - fake 404
	if($router_cache['strtok'] === $system['location_html'] . '/router.php')
	{
		http_response_code(404);
		echo '<!DOCTYPE html>
			<html>
				<head>
					<title>'.$system['title'].'</title>
					'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
					<meta http-equiv="refresh" content="0; url=.">
				</head>
			</html>
		';
		exit();
	}

	// 404 handle- for files
	if(!file_exists($_SERVER['DOCUMENT_ROOT'] . $router_cache['strtok']))
	{
		http_response_code(404);
		if(substr($router_cache['strtok'], -1) === '/')
			$url='..';
		else
			$url='.';

		echo '<!DOCTYPE html>
			<html>
				<head>
					<title>'.$system['title'].'</title>
					'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
					<meta http-equiv="refresh" content="0; url=' . $url . '">
				</head>
			</html>
		';
		exit();
	}

	// 404 handle - for dirs
	if(is_dir($_SERVER['DOCUMENT_ROOT'] . $router_cache['strtok']))
		if((file_exists($_SERVER['DOCUMENT_ROOT'] . $router_cache['strtok'] . '/index.php')) || (file_exists($_SERVER['DOCUMENT_ROOT'] . $router_cache['strtok'] . '/index.html')))
		{ /* everything is ok */ }
		else
		{
			http_response_code(404);
			if(substr($router_cache['strtok'], -1) === '/')
				$url='..';
			else
				$url='.';

			echo '<!DOCTYPE html>
				<html>
					<head>
						<title>'.$system['title'].'</title>
						'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
						<meta http-equiv="refresh" content="0; url=' . $url . '">
					</head>
				</html>
			';
			exit();
		}

	// denied file types
	if(preg_match('/\.(?:'.$router_cache['denied_file_extensions'].')$/', $router_cache['strtok'])) // if type ****.xxx in url
	{
		http_response_code(404);
		echo '<html>
			<head>
				<title>'.$system['title'].'</title>
				'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
				<meta http-equiv="refresh" content="0; url=.">
			</head>
		</html>';
		exit();
	}

	// url with index.php destroys application - prevent this
	if($router_cache['substr'] === 'index.php')
	{
		http_response_code(404);
		echo '<html>
			<head>
				<title>'.$system['title'].'</title>
				'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
				<meta http-equiv="refresh" content="0; url=.">
			</head>
		</html>';
		exit();
	}

	// fake 404 if path point to file 'disabled', 'description.php' and 'menu-addon.php'
	if(($router_cache['substr'] === 'disabled') || ($router_cache['substr'] === 'description.php') || ($router_cache['substr'] === 'menu-addon.php'))
	{
		http_response_code(404);
		echo '<html>
			<head>
				<title>'.$system['title'].'</title>
				'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
				<meta http-equiv="refresh" content="0; url=..">
			</head>
		</html>';
		exit();
	}

	// deny access to disabled modules
	if(file_exists($system['location_php'] . $router_cache['strtok'] . '/disabled'))
	{
		http_response_code(404);
		echo '<html>
			<head>
				<title>'.$system['title'].'</title>
				'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
				<meta http-equiv="refresh" content="0; url=..">
			</head>
		</html>';
		exit();
	}

	// deny access to lib/htmlheaders.php and cache_htmlheaders.php
	if(($router_cache['substr'] === 'htmlheaders.php') || ($router_cache['substr'] === 'cache_htmlheaders.php'))
	{
		http_response_code(404);
		echo '<html>
			<head>
				<title>'.$system['title'].'</title>
				'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
				<meta http-equiv="refresh" content="0; url=..">
			</head>
		</html>';
		exit();
	}

	// deny access to lib/htmlheaders/* and lib/htmlheaders_min/*
	if(($router_cache['explode']('/', substr($router_cache['strtok'], strlen($system['location_html'])), 2) === 'htmlheaders') || ($router_cache['explode']('/', substr($router_cache['strtok'], strlen($system['location_html'])), 2) === 'htmlheaders_min'))
	{
		http_response_code(404);
		echo '<html>
			<head>
				<title>'.$system['title'].'</title>
				'; include $system['location_php'] . '/lib/htmlheaders.php'; echo '
				<meta http-equiv="refresh" content="0; url=..">
			</head>
		</html>';
		exit();
	}

	// add http cache headers
	if($router_cache['http_cache_file_extensions'] !== false)
		if(preg_match('/\.(?:'.$router_cache['http_cache_file_extensions'].')$/', $router_cache['substr']))
		{
			// file headers
			header('Content-type: ' . mime_content_type($_SERVER['SCRIPT_FILENAME']));
			header('Content-length: ' . filesize($_SERVER['SCRIPT_FILENAME']));
	
			// cache headers
			header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 3600) . ' GMT');
			header('Pragma: cache');
			header('Cache-Control: max-age=3600');
	
			// stream file
			while(ob_get_level()) ob_end_clean(); // clear buffer
			readfile($_SERVER['SCRIPT_FILENAME']);
			exit();
		}

	// drop router cache
	unset($router_cache);

	// abort script - load destination file
	return false;
?>