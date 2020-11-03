#!/bin/sh
# log-rotate package
# install script

# Debian dependencies: notify-daemon

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='log-rotate'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e '/usr/local/etc/notify-daemon/events.rc.d' ]; then
	echo ' ! notify-daemon package not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/log-rotate.rc' ] || [ -e '/usr/local/sbin/log-rotate.sh' ]; then
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
echo -n '[ln] etc/log-rotate.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/log-rotate.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/notify-daemon
cd /usr/local/etc/notify-daemon/events.rc.d
echo -n '[ln] etc/notify-daemon/events.rc.d/log-rotate.rc /usr/local/etc/notify-daemon'
	ln -s ${PACKAGE_DIR}/etc/notify-daemon/events.rc.d/log-rotate.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/log-rotate.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/log-rotate.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
