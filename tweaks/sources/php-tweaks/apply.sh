#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /etc/php/7.0/cli/conf.d ]; then
	echo 'PHP 7 not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/php/7.0-cli-conf.d ]; then
	echo 'Create /usr/local/etc/php/7.0-cli-conf.d'
	exit 1
fi

# Check if is installed
if [ -e /etc/php/7.0/cli/conf.d/98-opcache.ini ] || [ -e /etc/php/7.0/cli/conf.d/99-security.ini ] || [ -e /usr/local/etc/php/7.0-cli-conf.d/98-opcache.ini ] || [ -e /usr/local/etc/php/7.0-cli-conf.d/99-security.ini ]; then
	echo 'Already installed'
	exit 1
fi

cd /usr/local/etc/php/7.0-cli-conf.d
for i in 98-opcache.ini 99-security.ini; do
	echo -n "[ln] etc/php/7.0-cli-conf.d/${i} /usr/local/etc/php/7.0-cli-conf.d"
		ln -s ${PACKAGE_DIR}/etc/php/7.0-cli-conf.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

cd /etc/php/7.0/cli/conf.d
for i in 98-opcache.ini 99-security.ini; do
	echo -n "[ln] /usr/local/etc/php/7.0-cli-conf.d/${i} /etc/php/7.0/cli/conf.d"
		ln -s /usr/local/etc/php/7.0-cli-conf.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
