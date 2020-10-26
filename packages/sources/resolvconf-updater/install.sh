#!/bin/sh
# resolvconf-updater package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='resolvconf-updater'

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
#if [ ! -e /usr/local/etc/rc.local.d ]; then
#	echo 'rc.local package not installed'
#	exit 1
#fi

# Check if installed
if [ -e /usr/local/etc/resolvconf-updater.d ] || [ -e /usr/local/sbin/resolvconf-updater.sh ] || [ -e /usr/local/etc/init.d/resolvconf-updater.sh ] || [ -e /etc/init.d/resolvconf-updater.sh ]; then
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

# Install - rc.local package
#cd /usr/local/share/etc/rc.local.d
#echo -n '[ln] etc/rc.local.d/resolvconf-updater.rc rc.local'
#	ln -s ${PACKAGE_DIR}/etc/rc.local.d/PKx_resolvconf-updater.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/resolvconf-updater.d /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/resolvconf-updater.d . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/resolvconf-updater.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/resolvconf-updater.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/resolvconf-updater.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/resolvconf-updater.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/resolvconf-updater.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/resolvconf-updater.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
#echo ' ! Configure /usr/local/etc/rc.local.d'
echo ' ! Insserv /etc/init.d/resolvconf-updater.sh'

echo ''
exit 0
