#!/bin/sh
# desktop-logout-gui package
# install script

# Debian dependencies: gtkdialog

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='desktop-logout-gui'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/bin/gtkdialog ] && [ ! -e /usr/local/bin/gtkdialog ]; then
	echo 'gtkdialog debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/bin/desktop-logout-gui ] || [ -e /usr/local/etc/desktop-logout-gui ] || [ -e /usr/local/share/desktop-logout-gui ]; then
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

# Install - /usr/local/bin
cd /usr/local/bin
echo -n '[ln] bin/desktop-logout-gui /usr/local/bin'
	ln -s ${PACKAGE_DIR}/bin/desktop-logout-gui . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/desktop-logout-gui /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/desktop-logout-gui . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/desktop-logout-gui /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/desktop-logout-gui . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
