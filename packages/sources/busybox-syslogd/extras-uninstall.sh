#!/bin/sh
# busybox-syslogd package
# extras uninstall script

# Settings
PACKAGE_NAME='busybox-syslogd'

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

# Uninstall - /usr/local/etc/insserv.conf.d
echo -n '[rm] /usr/local/etc/insserv.conf.d/busybox-syslogd'
	if [ -e '/usr/local/etc/insserv.conf.d/busybox-syslogd' ]; then
		rm /usr/local/etc/insserv.conf.d/busybox-syslogd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /etc/insserv.conf.d
echo -n '[rm] /etc/insserv.conf.d/busybox-syslogd'
	if [ -e '/etc/insserv.conf.d/busybox-syslogd' ]; then
		rm /etc/insserv.conf.d/busybox-syslogd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

echo ''
exit 0
