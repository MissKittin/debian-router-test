#!/bin/sh
# PXE Debian kernel version checker

print_S2()
{
	echo -n "$2"
}

[ -e /boot/version.txt-* ] || exit 1

if [ "$(apt-cache search "linux-image-$(ls /boot/version.txt-* | sed -e 's\/boot/version.txt-\\g')")" = '' ]; then
	echo 'kernel is obsolete'
	echo 'maybe apt-get update?'
	echo 'or dpkg --add-architecture ?'
	exit 1
elif dpkg --compare-versions "$(print_S2 $(apt-cache policy "linux-image-$(ls /boot/version.txt-* | sed -e 's\/boot/version.txt-\\g')" | grep 'Candidate'))" gt "$(cat /boot/version.txt-*)"; then
	echo 'kernel update is available'
	exit 0
else
	echo 'kernel is up to date'
	exit 1
fi
