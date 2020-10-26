#!/bin/sh
# hostapd config
# install script

# Debian dependencies: hostapd

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='hostapd'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e '/usr/local/etc/default' ]; then
	echo '/usr/local/etc/default not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ -e '/etc/default/hostapd.old' ]; then
	echo 'Backup files found'
	echo '/etc/default/hostapd.old exists'
	exit 1
fi

# Check installed packages
if [ ! -e '/usr/sbin/hostapd' ]; then
	echo 'hostapd debian package not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/hostapd' ] || [ -e '/usr/local/etc/default/hostapd' ] || [ -e '/etc/hostapd/hostapd.conf' ] || [ -e '/etc/default/hostapd.old' ]; then
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
echo -n '[ln] etc/hostapd /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/hostapd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/default
cd /usr/local/etc/default
echo -n '[ln] etc/default/hostapd /usr/local/etc/default'
	ln -s ${PACKAGE_DIR}/etc/default/hostapd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/default
cd /etc/default
echo -n '[mv] /etc/default/hostapd /etc/default/hostapd.old'
	mv ./hostapd ./hostapd.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/default/hostapd /etc/default'
	ln -s /usr/local/etc/default/hostapd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/hostapd
cd /etc/hostapd
echo -n '[ln] /usr/local/etc/hostapd/hostapd.conf /etc/hostapd'
	ln -s /usr/local/etc/hostapd/hostapd.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
