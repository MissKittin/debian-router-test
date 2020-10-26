#!/bin/sh
# fancontrol-weather package
# install script

# Debian recommended: wget

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='fancontrol-weather'

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
if [ ! -e /usr/bin/wget ]; then
	echo 'wget debian package not installed'
	sleep 1
fi

# Check if installed
if [ -e /usr/local/etc/fancontrol-weather.rc ] || [ -e /usr/local/etc/init.d/fancontrol-weather.sh ] || [ -e /usr/local/sbin/fancontrol-weather.sh ] || [ -e /usr/local/share/fancontrol-weather ]; then
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
echo -n '[ln] etc/fancontrol-weather.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/fancontrol-weather.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/fancontrol-weather.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/fancontrol-weather.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/fancontrol-weather.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/fancontrol-weather.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/fancontrol-weather /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/fancontrol-weather . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/fancontrol-weather.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/fancontrol-weather.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv fancontrol-weather.sh'
echo '  or install-extras.sh'

echo ''
exit 0
