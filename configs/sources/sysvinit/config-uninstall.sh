#!/bin/sh
# sysvinit config
# uninstall script

# Settings
PACKAGE_NAME='sysvinit'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if installed
if [ ! -e '/usr/local/etc/inittab' ] || [ ! -e '/usr/local/etc/init.d/.legacy-bootordering' ]; then
	echo 'Not installed'
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

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/inittab'
	rm /usr/local/etc/inittab > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/.legacy-bootordering'
	rm /usr/local/etc/init.d/.legacy-bootordering > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc
echo -n '[rm] /etc/inittab'
	rm /etc/inittab > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/.legacy-bootordering'
	rm /etc/init.d/.legacy-bootordering > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
