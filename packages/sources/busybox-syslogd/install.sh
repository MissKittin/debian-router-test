#!/bin/sh
# busybox-syslogd package
# install script

# Debian dependencies: busybox

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='busybox-syslogd'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check installed packages
if [ ! -e /bin/busybox ]; then
	echo 'busybox debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/init.d/busybox-syslogd ] || [ -e /etc/init.d/busybox-syslogd ]; then
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

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/busybox-syslogd /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/busybox-syslogd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/busybox-syslogd /etc/init.d'
	ln -s /usr/local/etc/init.d/busybox-syslogd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv /etc/init.d/busybox-syslogd'
echo ' ! Configure options in /etc/init.d/busybox-syslogd'

echo ''
exit 0
