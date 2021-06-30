#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /etc/sudoers.d ]; then
	echo 'sudo not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/sudoers.d ]; then
	echo 'Create /usr/local/etc/sudoers.d'
	exit 1
fi

# Check if is installed
if [ -e /usr/local/etc/sudoers.d/nodns ] || [ -e /etc/sudoers.d/nodns ]; then
	echo 'Already installed'
	exit 1
fi
if [ -e /usr/local/etc/sudoers.d/nolecture ] || [ -e /etc/sudoers.d/nolecture ]; then
	echo 'Already installed'
	exit 1
fi

cd /usr/local/etc/sudoers.d
echo -n '[ln] etc/sudoers.d/nodns /usr/local/etc/sudoers.d'
	ln -s ${PACKAGE_DIR}/etc/sudoers.d/nodns . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] etc/sudoers.d/nolecture /usr/local/etc/sudoers.d'
	ln -s ${PACKAGE_DIR}/etc/sudoers.d/nolecture . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/sudoers.d
echo -n '[ln] /usr/local/etc/sudoers.d/nodns /etc/sudoers.d'
	ln -s /usr/local/etc/sudoers.d/nodns . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/sudoers.d/nolecture /etc/sudoers.d'
	ln -s /usr/local/etc/sudoers.d/nolecture . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
