#!/bin/sh
# notify-daemon-fstrim package
# install script

# Dependencies: notify-daemon
# Requires /sbin/fstrim

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='notify-daemon-fstrim'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ -e '/var/local/notify-daemon-fstrim' ]; then
	echo '/var/local/notify-daemon-fstrim exists'
	exit 1
fi
if [ ! -e '/var/local' ]; then
	echo '/var/local not exists'
	exit 1
fi

# Check installed packages
if [ ! -e '/usr/local/etc/notify-daemon/events.rc.d' ]; then
	echo 'notify-daemon package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/notify-daemon/events.rc.d/fstrim.rc* ] || [ -e '/var/local/notify-daemon-fstrim' ]; then
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

# Install - /usr/local/etc/notify-daemon
cd /usr/local/etc/notify-daemon/events.rc.d
echo -n '[ln] etc/notify-daemon/events.rc.d/fstrim.rc /usr/local/etc/notify-daemon'
	ln -s ${PACKAGE_DIR}/etc/notify-daemon/events.rc.d/fstrim.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /var/local
cd /var/local
echo -n '[mkdir] /var/local/notify-daemon-fstrim'
	if mkdir /var/local/notify-daemon-fstrim > /dev/null 2>&1; then
		chown root:root /var/local/notify-daemon-fstrim
		echo ' [OK]'
	else
		echo ' [Fail]'
	fi

echo ''
exit 0
