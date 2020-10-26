#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check backup
if [ ! -e /etc/default/hwclock.old ]; then
	echo 'Backup file not found'
	exit 1
fi

# Check if is installed
if [ ! -e /etc/default/hwclock ] || [ ! -e /usr/local/etc/default ]; then
	echo 'Not installed'
	exit 1
fi

echo -n '[rm] /usr/local/etc/default/hwclock'
	rm /usr/local/etc/default/hwclock > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/default
echo -n '[rm] /etc/default/hwclock'
	rm /etc/default/hwclock > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/default/hwclock.old hwclock'
	mv hwclock.old hwclock > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
