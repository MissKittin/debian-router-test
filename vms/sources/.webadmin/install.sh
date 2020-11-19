#!/bin/sh
# vms - webadmin plugin
# install script

# Settings
PACKAGE_NAME='vms'
PACKAGE_DIR="$(dirname "$(readlink -f "${0}")")"

# check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have required power"
	exit 1
fi

# Check installed packages
if [ ! -e '/usr/local/share/webadmin' ]; then
	echo 'webadmin package is not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/share/webadmin/sys-vms' ]; then
	echo 'Already installed'
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

# Install - /usr/local/share/webadmin
cd /usr/local/share/webadmin
echo -n '[ln] sys-vms /usr/local/share/webadmin'
	ln -s ${PACKAGE_DIR}/sys-vms . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
