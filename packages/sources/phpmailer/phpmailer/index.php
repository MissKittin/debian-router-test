<?php
	// phpmailer - server side
	// 03.09.2020

	include(__DIR__ . '/settings.php');

	if((isset($_GET['user'])) && (isset($_GET['password'])) && (isset($_GET['recipient'])) && (isset($_GET['subject'])) && (isset($_GET['message'])))
	{
		if(($_GET['user'] === $user) && ($_GET['password'] === $password))
		{
			header('Content-Type: text/plain');
			if(mail($_GET['recipient'], $_GET['subject'], $_GET['message']))
			{
				echo 'accepted';
				exit(0);
			}
			else
			{
				//http_response_code(400);
				echo 'failed';
				exit(1);
			}
		}
		else
		{
			if(!@include(__DIR__ . '/404.php'))
			{
				//http_response_code(400);
				echo 'wrong data';
				exit(1);
			}
		}
	}

	if(!@include(__DIR__ . '/404.php'))
	{
		header('Content-Type: text/plain');
		http_response_code(400);
		echo 'wrong data';
		exit(1);
	}
?>