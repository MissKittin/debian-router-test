#!/bin/sh
# networking-mod tweak
# install script

# Debian dependencies: ifupdown

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='networking-mod'

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
if [ -e /etc/init.d/networking.old ]; then
	echo 'Backup file /etc/init.d/networking.old exists'
	exit 1
fi

# Check installed packages
if [ ! -e /etc/init.d/networking ]; then
	echo 'ifupdown debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/init.d/networking ]; then
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
echo -n '[ln] etc/init.d/networking /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/networking . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[mv] /etc/init.d/networking networking.old'
	mv networking networking.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/init.d/networking /etc/init.d'
	ln -s /usr/local/etc/init.d/networking . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Configure /usr/local/etc/rc.local.d'

echo ''
exit 0
