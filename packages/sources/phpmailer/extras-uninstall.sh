#!/bin/sh
# phpmailer package
# extras uninstall script

# Settings
PACKAGE_NAME='phpmailer'

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
echo -n '[rm] /usr/local/etc/notify-daemon/sender.rc.d/phpmailer.rc'
	if [ -e '/usr/local/etc/notify-daemon/sender.rc.d/phpmailer.rc' ]; then
		rm /usr/local/etc/notify-daemon/sender.rc.d/phpmailer.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi
echo -n '[rm] /usr/local/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc'
	if [ -e '/usr/local/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc' ]; then
		rm /usr/local/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

echo ''
exit 0
