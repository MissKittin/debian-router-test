#!/bin/sh
# ddns-client package
# install script

# Debian dependencies: wget

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='ddns-client'

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
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/ddns-client.rc ] || [ -e /usr/local/etc/init.d/ddns-client.sh ] || [ -e /usr/local/bin/ddns-client.sh ]; then
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
echo -n '[ln] etc/ddns-client.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/ddns-client.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/ddns-client.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/ddns-client.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/bin
cd /usr/local/bin
echo -n '[ln] bin/ddns-client.sh /usr/local/bin'
	ln -s ${PACKAGE_DIR}/bin/ddns-client.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/ddns-client.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/ddns-client.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv ddns-client.sh'
echo '  or install-extras.sh'

echo ''
exit 0
