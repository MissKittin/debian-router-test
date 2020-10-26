#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /etc/default/hwclock ]; then
	echo 'hwclock not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/default ]; then
	echo 'Create /usr/local/etc/default'
	exit 1
fi

# Check backup
if [ -e /etc/default/hwclock.old ]; then
	echo 'Backup file found'
	exit 1
fi

# Check if is installed
if [ -e /etc/default/hwclock ] || [ -e /usr/local/etc/default/hwclock ]; then
	echo 'Already installed'
	exit 1
fi

cd /usr/local/etc/default
echo -n '[ln] etc/default/hwclock /usr/local/etc/default'
	ln -s ${PACKAGE_DIR}/etc/default/hwclock . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/default
echo -n '[mv] /etc/default/hwclock hwclock.old'
	mv hwclock hwclock.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/default/hwclock /etc/default'
	ln -s /usr/local/etc/default/hwclock . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
