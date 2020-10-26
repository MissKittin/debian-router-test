#!/bin/sh
# radvd config
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='radvd'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/radvd.conf'
	if [ -L '/usr/local/etc/radvd.conf' ] && [ -e '/usr/local/etc/radvd.conf' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc
echo -n '/etc/radvd.conf'
	if [ -L '/etc/radvd.conf' ] && [ -e '/etc/radvd.conf' ]; then
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
