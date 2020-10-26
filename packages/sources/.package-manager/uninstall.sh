#!/bin/sh
# Package manager
# uninstall script

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e "$(readlink -f "$(dirname "$(readlink -f "$0")")/..")/package-manager.sh" ]; then
	echo 'Not installed'
	exit 1
fi

echo -n '[rm] package-manager.sh'
	cd $(readlink -f "$(dirname "$(readlink -f "$0")")/..")
	rm ./package-manager.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
