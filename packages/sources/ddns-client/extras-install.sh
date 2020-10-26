#!/bin/sh
# ddns-client package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='ddns-client'

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

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/ddns-client.sh'
	rm /etc/init.d/ddns-client.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/rc.local.d
if cd /usr/local/etc/rc.local.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/rc.local.d/ddns-client.rc /usr/local/etc/rc.local.d'
		ln -s ${PACKAGE_DIR}/extras/etc/rc.local.d/PKx_ddns-client.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
else
	echo 'rc.local is not installed'
fi

# Notification
echo ''
echo ' ! Configure /usr/local/etc/rc.local.d'

echo ''
exit 0
