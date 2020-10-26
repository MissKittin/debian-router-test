#!/bin/sh
# vms - webadmin plugin
# uninstall script

# Settings
PACKAGE_NAME='vms'

# check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have required power"
	exit 1
fi

# Check if installed
if [ ! -e '/usr/local/share/webadmin/sys-vms' ]; then
	echo 'Not installed'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/share/webadmin
echo -n '[rm] /usr/local/share/webadmin/sys-vms'
	rm /usr/local/share/webadmin/sys-vms > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
