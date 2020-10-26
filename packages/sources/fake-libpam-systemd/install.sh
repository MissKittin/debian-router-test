#!/bin/sh
# fake-libpam-systemd package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='fake-libpam-systemd'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/apt/sources.list.d ]; then
	echo '/usr/local/etc/apt/sources.list.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/apt/sources.list.d/fake-libpam-systemd.list ] || [ -e /usr/local/share/fake-libpam-systemd ] || [ -e /etc/apt/sources.list.d/fake-libpam-systemd.list ]; then
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

# Install - /usr/local/etc/apt
cd /usr/local/etc/apt/sources.list.d
echo -n '[ln] etc/apt/sources.list.d/fake-libpam-systemd.list /usr/local/etc/apt/sources.list.d'
	ln -s ${PACKAGE_DIR}/etc/apt/sources.list.d/fake-libpam-systemd.list . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/fake-libpam-systemd /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/fake-libpam-systemd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/apt
cd /etc/apt/sources.list.d
echo -n '[ln] /usr/local/etc/apt/sources.list.d/fake-libpam-systemd.list /etc/apt/sources.list.d'
	ln -s /usr/local/etc/apt/sources.list.d/fake-libpam-systemd.list . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
