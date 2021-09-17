#!/bin/sh
# misc package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='misc'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ -e /etc/issue.old ] || [ -e /etc/motd.old ]; then
	echo 'Backup files found'
	exit 1
fi

# Check if installed
if [ -e /usr/local/sbin/set-zram.sh ]; then
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

# Install - /usr/local/etc
cd /usr/local/etc
for i in issue motd; do
	echo -n '[ln] etc/'"${i}"' /usr/local/etc'
		ln -s ${PACKAGE_DIR}/etc/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/sbin
cd /usr/local/sbin
for i in set-zram.sh; do
	echo -n '[ln] sbin/'"${i}"' /usr/local/sbin'
		ln -s ${PACKAGE_DIR}/sbin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc
cd /etc
for i in issue motd; do
	echo -n '[mv] /etc/'"${i}"' /etc/'"${i}"'.old'
		mv ${i} ${i}.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	echo -n '[ln] etc/'"${i}"' /usr/local/etc'
		ln -s ${PACKAGE_DIR}/etc/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
