#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e /etc/php/7.0/cli/conf.d/98-opcache.ini ] || [ ! -e /etc/php/7.0/cli/conf.d/99-security.ini ] || [ ! -e /usr/local/etc/php/7.0-cli-conf.d/98-opcache.ini ] || [ ! -e /usr/local/etc/php/7.0-cli-conf.d/99-security.ini ]; then
	echo 'Not installed'
	exit 1
fi

for i in 98-opcache.ini 99-security.ini; do
	echo -n "[rm] /usr/local/etc/php/7.0-cli-conf.d/${i}"
		rm /usr/local/etc/php/7.0-cli-conf.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

for i in 98-opcache.ini 99-security.ini; do
	echo -n "[rm] /etc/php/7.0/cli/conf.d/${i}"
		rm /etc/php/7.0/cli/conf.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
