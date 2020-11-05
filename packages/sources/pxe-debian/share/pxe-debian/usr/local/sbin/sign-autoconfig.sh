#!/bin/sh
# PXE Debian autoconfig signer

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check ids
#if [ ! -e "/sys/class/dmi/id/product_uuid" ]; then
if [ ! -e "/sys/class/dmi/id" ]; then
	#echo '/sys/class/dmi/id/product_uuid not found'
	echo '/sys/class/dmi/id not found'
	echo 'autoconfig is not supported on this machine'
	exit 1
fi
if [ ! -e "/usr/local/etc/pxe-debian.id" ]; then
	echo 'PXE Debian id number not found'
	exit 1
fi

# Check parameters
if [ "$1" = '' ]; then
	echo 'usage: sign-autoconfig.sh .YOUR_PARTITION'
	echo 'eg: sign-autoconfig.sh .sda1'
	exit 1
fi
if [ ! -e "/media/${1}/.pxe-debian/autoconfig.rc" ]; then
	echo "/media/${1}/.pxe-debian/autoconfig.rc not exists"
	exit 1
fi

# Generate key
#cat /sys/class/dmi/id/product_uuid /usr/local/etc/pxe-debian.id /media/${1}/.pxe-debian/autoconfig.rc | md5sum | awk '{print $1}' > /media/${1}/.pxe-debian/autoconfig.rc.key && echo 'signed' || echo 'write error'
cat /sys/class/dmi/id/* /usr/local/etc/pxe-debian.id /media/${1}/.pxe-debian/autoconfig.rc 2>/dev/null | md5sum | awk '{print $1}' > /media/${1}/.pxe-debian/autoconfig.rc.key && echo 'signed' || echo 'write error'

exit 0
