#!/bin/sh
# notify-daemon package
# extras uninstall script

# Settings
PACKAGE_NAME='notify-daemon'

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

# Uninstall - /usr/local/bin
echo -n '[rm] /usr/local/bin/notify-send-mail.sh'
	if [ -e '/usr/local/bin/notify-send-mail.sh' ]; then
		rm /usr/local/bin/notify-send-mail.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/etc/notify-daemon
echo -n '[rm] /usr/local/etc/notify-daemon/sender.rc.d/mail.rc'
	if [ -e '/usr/local/etc/notify-daemon/sender.rc.d/mail.rc' ]; then
		rm /usr/local/etc/notify-daemon/sender.rc.d/mail.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi
echo -n '[rm] /usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc'
	if [ -e '/usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc' ]; then
		rm /usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/share/webadmin
echo -n '[rm] /usr/local/share/webadmin/sys-notifications'
	if [ -e '/usr/local/share/webadmin/sys-notifications' ]; then
		rm /usr/local/share/webadmin/sys-notifications > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi
echo -n '[rm] /usr/local/share/webadmin/home-plugins/notifications'
	if [ -e /usr/local/share/webadmin/home-plugins/*_notifications ]; then
		rm /usr/local/share/webadmin/home-plugins/*_notifications > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

echo ''
exit 0
