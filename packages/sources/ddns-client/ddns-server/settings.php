<?php
	/*
	* Usage: sent arguments in GET form
	* For Bash DDNS client:
	*	user=username -> your username in client settings
	*	password=set_password -> your password in client settings
	*	client=client_name -> client name in settings
	* For view:
	*	user=view_username -> string in $view_user
	*	password=view_password -> string in $view_password
	*	notime=1 -> print only ip number
	* $ddns_client_ip: log ip from http server
	*	to disable this, comment line 26
	*	and set ip_from_client to true in etc/ddns-client.rc
	*/

	// Settings - for set part
	$set_user='setuser';
	$set_password='setpassword';

	// Settings - for view part
	$view_user='viewuser';
	$view_password='viewpassword';

	// Settings - server variable with client IP
	$ddns_client_ip=$_SERVER['REMOTE_ADDR']; // setup this for your http server if not working
?>