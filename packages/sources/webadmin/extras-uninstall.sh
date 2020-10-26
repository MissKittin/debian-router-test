#!/bin/sh
# webadmin package
# extras uninstall script

# Settings
PACKAGE_NAME='webadmin'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
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

# Uninstall - /usr/local/etc/notify-daemon
echo -n '[rm] /usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc'
	if [ -e '/usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc' ]; then
		rm /usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi
echo -n '[rm] /usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc'
	if [ -e '/usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc' ]; then
		rm /usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

echo ''
exit 0
