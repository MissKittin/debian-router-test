#!/bin/sh
# rc.local package
# install script

# Debian dependencies: initscripts

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='rc.local'

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
if [ ! -e /etc/init.d/rc.local ]; then
	echo 'initscripts debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/rc.local ] || [ -e /usr/local/etc/rc.local.d ]; then
	echo 'Already installed'
	exit 1
fi
if [ -e /etc/rc.local.old ]; then
	echo '/etc/rc.local.old exists'
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
echo -n '[ln] etc/rc.local /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/rc.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] etc/rc.local.d /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/rc.local.d . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/rc.local /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/rc.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc
cd /etc
echo -n '[mv] /etc/rc.local /etc/rc.local.old'
	mv /etc/rc.local /etc/rc.local.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/rc.local /etc'
	ln -s /usr/local/etc/rc.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[mv] /etc/init.d/rc.local /etc/init.d/rc.local.old'
	mv /etc/init.d/rc.local /etc/init.d/rc.local.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/init.d/rc.local /etc/init.d'
	ln -s /usr/local/etc/init.d/rc.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
