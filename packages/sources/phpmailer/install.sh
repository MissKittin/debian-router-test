#!/bin/sh
# phpmailer package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='phpmailer'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e /usr/bin/wget ]; then
	echo 'wget debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/sbin/phpmailer.sh ] || [ -e /usr/local/etc/phpmailer.rc ]; then
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
echo -n '[ln] etc/phpmailer.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/phpmailer.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/phpmailer.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/phpmailer.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
