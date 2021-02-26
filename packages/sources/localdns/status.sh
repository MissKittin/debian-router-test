#!/bin/sh
# localdns package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='localdns'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/localdns.d'
	if [ -L /usr/local/etc/localdns.d ] && [ -e /usr/local/etc/localdns.d ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/localdns.sh'
	if [ -L /usr/local/etc/init.d/localdns.sh ] && [ -e /usr/local/etc/init.d/localdns.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/localdns.sh'
	if [ -L /etc/init.d/localdns.sh ] && [ -e /etc/init.d/localdns.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/localdns.sh'
	if [ -L /usr/local/sbin/localdns.sh ] && [ -e /usr/local/sbin/localdns.sh ]; then
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
