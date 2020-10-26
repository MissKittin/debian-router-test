#!/bin/sh
# fancontrol config
# install script

# Debian dependencies: fancontrol

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='fancontrol'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e /usr/sbin/fancontrol ]; then
	echo 'fancontrol debian package not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/fancontrol' ] || [ -e '/etc/fancontrol' ]; then
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

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/fancontrol /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/fancontrol . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc
cd /etc
echo -n '[ln] /usr/local/etc/fancontrol /etc'
	ln -s /usr/local/etc/fancontrol . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
