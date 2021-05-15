#!/bin/sh
# fake-systemd package
# uninstall script

# Settings
PACKAGE_NAME='fake-systemd'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
if [ ! -e /usr/local/etc/apt/sources.list.d/fake-systemd.list ] || [ ! -e /usr/local/share/fake-systemd ] || [ ! -e /etc/apt/sources.list.d/fake-systemd.list ]; then
	echo 'Not installed'
	exit 1
fi

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# Question
echo -n 'Are you sure? (y/[n]) '
read answer
[ "${answer}" = 'y' ] || exit 0
echo ''

# Uninstall - /usr/local/etc/apt
echo -n '[rm] /usr/local/etc/apt/sources.list.d/fake-systemd.list'
	rm /usr/local/etc/apt/sources.list.d/fake-systemd.list > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/fake-systemd'
	rm /usr/local/share/fake-systemd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'


# Uninstall - /etc/apt
echo -n '[rm] /etc/apt/sources.list.d/fake-systemd.list'
	rm /etc/apt/sources.list.d/fake-systemd.list > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
