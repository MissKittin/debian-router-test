#!/bin/sh
# webadmin package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='webadmin'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/etc/notify-daemon
if cd /usr/local/etc/notify-daemon/events.rc.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc /usr/local/etc/notify-daemon/events.rc.d'
		if [ -e '/usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
	cd /usr/local/etc/notify-daemon/journal-manager.rc.d
	echo -n '[ln] extras/etc/notify-daemon/journal-manager.rc.d/www.rc /usr/local/etc/notify-daemon/journal-manager.rc.d'
		if [ -e '/usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/journal-manager.rc.d/www.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo 'notify-daemon is not installed'
fi

echo ''
exit 0
