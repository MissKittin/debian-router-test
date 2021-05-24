#!/bin/sh
# toggle-wakeup-events package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='toggle-wakeup-events'

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

# Check if installed
if [ -e /usr/local/etc/toggle-wakeup-events.rc ] || [ -e /usr/local/etc/init.d/toggle-wakeup-events ] || [ -e /usr/local/sbin/toggle-wakeup-events.sh ] || [ -e /etc/init.d/toggle-wakeup-events ]; then
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
echo -n '[ln] etc/toggle-wakeup-events.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/toggle-wakeup-events.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/toggle-wakeup-events /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/toggle-wakeup-events . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/toggle-wakeup-events.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/toggle-wakeup-events.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/toggle-wakeup-events /etc/init.d'
	ln -s /usr/local/etc/init.d/toggle-wakeup-events . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv /etc/init.d/toggle-wakeup-events'

echo ''
exit 0
