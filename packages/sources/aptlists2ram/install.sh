#!/bin/sh
# aptlists2ram package
# install script

# Dependencies: rc.local, rcdown.local

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='aptlists2ram'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/apt ]; then
	echo '/usr/local/etc/apt not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ ! -e /usr/local/etc/apt/apt.conf.d ]; then
	echo '/usr/local/etc/apt/apt.conf.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check installed packages
if [ ! -e /usr/local/etc/rc.local.d ]; then
	echo 'rc.local package not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/rcdown.local.d ]; then
	echo 'rcdown.local package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ] || [ -e /usr/local/etc/rc.local.d/P*_aptlists2ram.rc ] || [ -e /usr/local/etc/rc.local.d/*_aptlists2ram.rc ] || [ -e /etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ]; then
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

# Install - rc.local package
cd /usr/local/etc/rc.local.d
echo -n '[ln] etc/rc.local.d/aptlists2ram.rc rc.local'
	ln -s ${PACKAGE_DIR}/etc/rc.local.d/PKx_aptlists2ram.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - rcdown.local package
cd /usr/local/etc/rcdown.local.d
echo -n '[ln] etc/rcdown.local.d/aptlists2ram.rc rcdown.local'
	ln -s ${PACKAGE_DIR}/etc/rcdown.local.d/Sx_aptlists2ram.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/apt/apt.conf.d
cd /usr/local/etc/apt/apt.conf.d
echo -n '[ln] etc/apt/apt.conf.d/aptlists2ram-compress-indexes /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/apt/apt.conf.d/aptlists2ram-compress-indexes ./02aptlists2ram-compress-indexes > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/apt/apt.conf.d
cd /etc/apt/apt.conf.d
echo -n '[ln] /usr/local/etc/apt/apt.conf.d/aptlists2ram-compress-indexes /etc/apt/apt.conf.d'
	ln -s /usr/local/etc/apt/apt.conf.d/02aptlists2ram-compress-indexes . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Configure /usr/local/etc/rc.local.d'
echo ' ! Configure /usr/local/etc/rcdown.local.d'

echo ''
exit 0
