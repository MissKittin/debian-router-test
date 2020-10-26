#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check backup
if [ ! -e /etc/ssh/sshd_config.old ]; then
	echo 'Backup file not found'
	exit 1
fi

# Check if is installed
if [ ! -e /usr/local/etc/ssh/sshd_config ]; then
	echo 'Not installed'
	exit 1
fi

echo -n '[rm] /usr/local/etc/default/hwclock'
	rm /usr/local/etc/ssh/sshd_config > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/ssh
echo -n '[rm] /etc/ssh/sshd_config'
	rm /etc/ssh/sshd_config > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/ssh/sshd_config.old sshd_config'
	mv sshd_config.old sshd_config > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
