#!/bin/sh
# sysvinit config
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='sysvinit'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/inittab'
	if [ -L '/usr/local/etc/inittab' ] && [ -e '/usr/local/etc/inittab' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d/.legacy-bootordering
echo -n '/usr/local/etc/init.d/.legacy-bootordering'
	if [ -L '/usr/local/etc/init.d/.legacy-bootordering' ] && [ -e '/usr/local/etc/init.d/.legacy-bootordering' ]; then
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
