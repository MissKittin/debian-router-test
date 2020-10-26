#!/bin/sh
# sysvinit config
# install script

# Debian dependencies: sysvinit-core

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='sysvinit'

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
if [ ! -e /usr/share/sysvinit ]; then
	echo 'sysvinit-core debian package not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/inittab' ] || [ -e '/usr/local/etc/init.d/.legacy-bootordering' ]; then
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
echo -n '[ln] etc/inittab /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/inittab . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/.legacy-bootordering /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/.legacy-bootordering . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd /etc
echo -n '[ln] /usr/local/etc/inittab /etc'
	ln -s /usr/local/etc/inittab . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/.legacy-bootordering /etc/init.d'
	ln -s /usr/local/etc/init.d/.legacy-bootordering . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
