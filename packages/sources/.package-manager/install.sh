#!/bin/sh
# Package manager
# install script

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ -e "$(readlink -f "$(dirname "$(readlink -f "$0")")/..")/package-manager.sh" ]; then
	echo 'Already installed'
	exit 1
fi

echo -n '[ln] bin/package-manager.sh'
	cd $(readlink -f "$(dirname "$(readlink -f "$0")")/..")
	ln -s ./.package-manager/bin/package-manager.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
