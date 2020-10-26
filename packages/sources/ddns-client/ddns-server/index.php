<?php
	// ddns server
	// 17.01.2019
	// fake 404 16.10.2019
	// client info 08.11.2019
	// packaged version 30.07.2020
	// ddns client ip catched by server 03.08.2020

	// Read settings
	include(__DIR__ . '/settings.php');

	// Check if username, password and client name exists in variables
	if(isset($_GET['user']) && isset($_GET['password']))
	{
		// Output as plain
		header('Content-Type: text/plain');

		// Set part - save data from client
		if($_GET['user'] === $set_user && $_GET['password'] === $set_password)
		{
			// Save data to files
			if(isset($ddns_client_ip)) file_put_contents('ip.txt', $ddns_client_ip); else file_put_contents('ip.txt', $_GET['ip']);
			file_put_contents('date.txt', $_GET['date'] . ' ' . $_GET['time']);
			if(isset($_GET['client'])) file_put_contents('client.txt', $_GET['client']); else file_put_contents('client.txt', 'client_name_undefined');

			// Send confirmation to client
			echo 'OK';
			exit(0);
		}

		// View part - print saved data
		if($_GET['user'] === $view_user && $_GET['password'] === $view_password)
		{
			// Check txt files
			if((!file_exists('ip.txt')) || (!file_exists('date.txt')) || (!file_exists('client.txt')))
			{
				echo 'no ip number logged';
				exit(0);
			}

			// Check if client want pure ip number
			if(isset($_GET['notime']))
				echo file_get_contents('ip.txt'); // Read file
			else // Read files
				echo file_get_contents('ip.txt') . PHP_EOL . file_get_contents('date.txt') . PHP_EOL . file_get_contents('client.txt');

			exit(0);
		}
	}

	// credentials validation failed
	if(!@include(__DIR__ . '/404.php')) echo 'fail';
?>