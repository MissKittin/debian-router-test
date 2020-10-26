#!/bin/sh
# fancontrol config
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='fancontrol'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/fancontrol'
	if [ -L '/usr/local/etc/fancontrol' ] && [ -e '/usr/local/etc/fancontrol' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc
echo -n '/etc/fancontrol'
	if [ -L '/etc/fancontrol' ] && [ -e '/etc/fancontrol' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Config package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Config package is installed'
	exit 0
else
	echo ' Config package is not installed'
	exit 1
fi
