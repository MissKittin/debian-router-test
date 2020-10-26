#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e /usr/local/etc/sudoers.d/nodns ] || [ ! -e /usr/local/etc/sudoers.d/nodns ]; then
	echo 'Not installed'
	exit 1
fi

echo -n '[rm] /usr/local/etc/sudoers.d/nodns'
	rm /usr/local/etc/sudoers.d/nodns > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/sudoers.d
echo -n '[rm] /etc/sudoers.d/nodns'
	rm /etc/sudoers.d/nodns > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]']'

exit 0
