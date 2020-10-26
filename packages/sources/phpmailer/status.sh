#!/bin/sh
# phpmailer package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='phpmailer'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/phpmailer.rc'
	if [ -L /usr/local/etc/phpmailer.rc ] && [ -e /usr/local/etc/phpmailer.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/phpmailer.sh'
	if [ -L /usr/local/sbin/phpmailer.sh ] && [ -e /usr/local/sbin/phpmailer.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
