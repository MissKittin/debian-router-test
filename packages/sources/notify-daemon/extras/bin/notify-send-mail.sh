#!/bin/bash
################################
### Bash & PHP send-mail script
### 13.02.2019
################################

# Help
if [ "$1" = '--help' ]; then
	echo; echo ' Bash send-mail script'
	echo 'mainly for notify-daemon.sh'
	echo; echo ' Usage:'
	echo 'notify-send-mail.sh server_address login password mail_recipient_address mail_subject mail_message'
	echo 'Script won'"'"'t start without all parameters!'
	echo; echo ' Attention!'
	echo 'All spaces in mail_subject and mail_message must be changed to + character, eg:'
	echo 'notify-send-mail.sh https://myhost.net/mailserver username pass dodo@example.com My+email+subject My+email+message'
	echo; echo ' PHP sender script at the bottom of this file.'
	exit 0
fi

# Parameter check
[ "$1" = '' ] && exit 1 # server address
[ "$2" = '' ] && exit 1 # username
[ "$3" = '' ] && exit 1 # password
[ "$4" = '' ] && exit 1 # mail recipient address
[ "$5" = '' ] && exit 1 # mail subject
[ "$6" = '' ] && exit 1 # mail message

# Send message to server
result=`wget -q -O- "${1}?user=${2}&password=${3}&recipient=${4}&subject=${5}&message=${6}"`

# Return result
[ "$?" = 0 ] || \
	echo -n 'Network failed'
[ "$result" = 'OK' ] || \
	echo -n ' PHP failed'

# Prevent running PHP script below
exit 0

<?php
	// PHP mail sender
	// 13.02.2019
	// fake 404 16.10.2019

	/* Usage: sent arguments in GET form
	Settings:
		user=username -> your username in client first parameter
		password=password -> your password in client second parameter */

	// Settings - security
	$user='username';
	$password='password';

	// Check if username and password exists in variables
	if(isset($_GET['user']) && isset($_GET['password']))
	{
		// Validate login and password
		if($_GET['user'] === $user && $_GET['password'] === $password)
		{
			// Send email
			mail($_GET['recipient'],$_GET['subject'],$_GET['message']);

			// Send confirmation to client
			echo 'OK';

			// Done
			exit();	
		}
	}
	http_response_code(404);
?>
<!-- You can write page here -->