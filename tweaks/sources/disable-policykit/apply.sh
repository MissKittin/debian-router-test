#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /etc/polkit-1/localauthority/50-local.d ]; then
	echo 'install policykit first'
	exit 1
fi
if [ ! -e /usr/local/etc/polkit-1/localauthority/50-local.d ]; then
	echo 'Create directory /usr/local/etc/polkit-1/localauthority/50-local.d'
	exit 1
fi

# Check if is installed
if [ -e /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla ] || [ -e /etc/polkit-1/localauthority/50-local.d/allow_everything.pkla ]; then
	echo 'Already installed'
	exit 1
fi

cd /usr/local/etc/polkit-1/localauthority/50-local.d
echo -n '[ln] etc/polkit-1/localauthority/50-local.d/allow_everything.pkla /usr/local/etc/polkit-1/localauthority/50-local.d'
	ln -s ${PACKAGE_DIR}/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/polkit-1/localauthority/50-local.d
echo -n '[ln] /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla /etc/polkit-1/localauthority/50-local.d'
	ln -s /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
