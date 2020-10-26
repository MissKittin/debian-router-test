#!/bin/sh
# debian-eol package
# install script

# Debian dependencies: php-cli

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='debian-eol'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e /usr/bin/php ]; then
	echo ' ! php-cli debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/bin/debian-eol.php ]; then
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

# Install - /usr/local/bin
cd /usr/local/bin
echo -n '[ln] bin/debian-eol.php /usr/local/bin'
	ln -s ${PACKAGE_DIR}/bin/debian-eol.php . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
