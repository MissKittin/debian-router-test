#!/bin/sh
# init-log-kmsg tweak
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='init-log-kmsg'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /sbin/init ]; then
	echo '/sbin/init not found!'
	exit 1
fi

# Check if installed
if [ -e /usr/local/sbin/init-log-kmsg.sh ]; then
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

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/init-log-kmsg.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/init-log-kmsg.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Add: init=/usr/local/sbin/init-log-kmsg.sh :to kernel command line'

echo ''
exit 0
