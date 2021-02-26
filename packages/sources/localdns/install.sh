#!/bin/sh
# localdns package
# install script

# Debian recommended: dnsmasq

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='localdns'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check installed packages
if [ ! -e /usr/sbin/dnsmasq ]; then
	echo 'dnsmasq debian package not installed'
	sleep 1
fi

# Check if installed
if [ -e /usr/local/etc/localdns.d ] || [ -e /usr/local/etc/init.d/localdns.sh ] || [ -e /etc/init.d/localdns.sh ] || [ -e /usr/local/sbin/localdns.sh ]; then
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
echo -n '[ln] etc/localdns.d /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/localdns.d . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/localdns.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/localdns.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d/
echo -n '[ln] /usr/local/etc/init.d/localdns.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/localdns.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/localdns.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/localdns.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv /etc/init.d/localdns.sh'

echo ''
exit 0
