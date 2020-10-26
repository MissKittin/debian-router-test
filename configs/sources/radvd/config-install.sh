#!/bin/sh
# radvd config
# install script

# Debian dependencies: radvd

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='radvd'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e /usr/sbin/radvd ]; then
	echo 'radvd debian package not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/radvd.conf' ] || [ -e '/etc/radvd.conf' ]; then
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
echo -n '[ln] etc/radvd.conf /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/radvd.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc
cd /etc
echo -n '[ln] /usr/local/etc/radvd.conf /etc'
	ln -s /usr/local/etc/radvd.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
