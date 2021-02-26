#!/bin/sh
# isc-dhcp-ddns package
# uninstall script

# Settings
PACKAGE_NAME='isc-dhcp-ddns'

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
if [ ! -e /usr/local/sbin/isc-dhcp-ddns4.sh ] || [ ! -e /usr/local/sbin/isc-dhcp-ddns6.sh ]; then
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

# Uninstall - /usr/local/sbin
cd /usr/local/sbin
for i in isc-dhcp-ddns4.sh isc-dhcp-ddns6.sh; do
	echo -n '[rm] /usr/local/sbin/'"${i}"
		rm /usr/local/sbin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Notification
echo ''
echo ' ! Configure isc-dhcp-server events'

echo ''
exit 0
