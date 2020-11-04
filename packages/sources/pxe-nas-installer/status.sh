#!/bin/sh
# pxe-nas-installer package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='pxe-nas-installer'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/sbin
echo -n '/usr/local/sbin/pxe-nas-installer'
	if [ -L '/usr/local/sbin/pxe-nas-installer' ] && [ -e '/usr/local/sbin/pxe-nas-installer' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/share
echo -n '/usr/local/share/pxe-nas-installer'
	if [ -L '/usr/local/share/pxe-nas-installer' ] && [ -e '/usr/local/share/pxe-nas-installer' ]; then
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
