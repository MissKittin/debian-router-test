#!/bin/sh
# busybox-syslogd package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='busybox-syslogd'

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

# Install - /usr/local/etc/insserv.conf.d
if cd /usr/local/etc/insserv.conf.d > /dev/null 2>&1; then
	echo -n '[ln] etc/insserv.conf.d/busybox-syslogd /usr/local/etc/insserv.conf.d'
		if [ -e '/usr/local/etc/insserv.conf.d/busybox-syslogd' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/etc/insserv.conf.d/busybox-syslogd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo '[ln] etc/insserv.conf.d/busybox-syslogd /usr/local/etc/insserv.conf.d [Fail]'
fi

# Install - /etc/insserv.conf.d
if cd /etc/insserv.conf.d > /dev/null 2>&1; then
	echo -n '[ln] /usr/local/etc/insserv.conf.d/busybox-syslogd /etc/insserv.conf.d'
		if [ -e '/etc/insserv.conf.d/busybox-syslogd' ]; then
			echo ' [EXISTS]'
		else
			ln -s /usr/local/etc/insserv.conf.d/busybox-syslogd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo '[ln] /usr/local/etc/insserv.conf.d/busybox-syslogd /etc/insserv.conf.d [Fail]'
fi

echo ''
exit 0
