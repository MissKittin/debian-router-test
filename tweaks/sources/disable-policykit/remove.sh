#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla ] || [ ! -e /etc/polkit-1/localauthority/50-local.d/allow_everything.pkla ]; then
	echo 'Not installed'
	exit 1
fi

echo -n '[rm] /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla'
	rm /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo -n '[rm] /etc/polkit-1/localauthority/50-local.d/allow_everything.pkla'
	rm /etc/polkit-1/localauthority/50-local.d/allow_everything.pkla > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
