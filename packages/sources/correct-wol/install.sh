#!/bin/sh
# correct-wol package
# install script

# Debian dependencies: ethtool

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='correct-wol'

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
if [ ! -e /sbin/ethtool ]; then
	echo 'ethtool debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/correct-wol.rc ] || [ -e /usr/local/etc/init.d/correct-wol.sh ] || [ -e /usr/local/sbin/correct-wol.sh ]; then
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
echo -n '[ln] etc/correct-wol.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/correct-wol.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/correct-wol.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/correct-wol.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/correct-wol.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/correct-wol.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/correct-wol.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/correct-wol.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv correct-wol.sh'

echo ''
exit 0
