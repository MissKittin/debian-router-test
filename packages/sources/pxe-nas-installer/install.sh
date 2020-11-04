#!/bin/sh
# pxe-nas-installer package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='pxe-nas-installer'

# Check if installed
if [ -e '/usr/local/sbin/pxe-nas-installer' ] || [ -e '/usr/local/share/pxe-nas-installer' ]; then
	echo 'Already installed'
	exit 1
fi

# Splash # Question
if [ ! "${1}" = '--force' ]; then
	echo 'Do not install package manually'
	echo 'Install it via pxe-debian-toolbox.sh'
	exit 1
fi
echo ''

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/pxe-nas-installer /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/pxe-nas-installer . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/pxe-nas-installer /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/pxe-nas-installer . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
