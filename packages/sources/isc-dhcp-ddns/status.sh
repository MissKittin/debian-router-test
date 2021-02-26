#!/bin/sh
# isc-dhcp-ddns package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='isc-dhcp-ddns'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/sbin
for i in isc-dhcp-ddns4.sh isc-dhcp-ddns6.sh; do
	echo -n "/usr/local/sbin/${i}"
		if [ -L /usr/local/sbin/${i} ] && [ -e /usr/local/sbin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# Notify
echo ''
if $broken && $installed; then
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
