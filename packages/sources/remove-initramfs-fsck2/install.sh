#!/bin/sh
# remove-initramfs-fsck2 tweak
# install script

# Debian dependencies: initramfs-tools sysvinit-core

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='remove-initramfs-fsck2'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ ! -e /etc/init.d/.legacy-bootordering ]; then
	echo '/etc/init.d/.legacy-bootordering not exists'
	echo 'Legacy bootordering is required'
	exit 1
fi

# Check installed packages
if [ ! -e /usr/share/sysvinit ]; then
	echo 'sysvinit-core debian package not installed'
	sleep 1
fi
if [ ! -e /usr/share/initramfs-tools ]; then
	echo 'initramfs-tools debian package not installed'
	sleep 1
fi

# Check if installed
if [ -e /boot/initrd-fsck-patch2.img ] || [ -e /usr/local/etc/init.d/remove-initramfs-fsck2.sh ] || [ -e /etc/init.d/remove-initramfs-fsck2.sh ]; then
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

# Install - /boot
cd /boot
echo -n '[ln] boot/initrd-fsck-patch2.img /boot'
	ln -s ${PACKAGE_DIR}/boot/initrd-fsck-patch2.img . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/remove-initramfs-fsck2.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/remove-initramfs-fsck2.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/remove-initramfs-fsck2.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/remove-initramfs-fsck2.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Insserv - /etc/rcS.d
cd /etc/rcS.d
echo -n '[ln] /etc/init.d/remove-initramfs-fsck2.sh /etc/rcS.d'
	ln -s ../init.d/remove-initramfs-fsck2.sh ./S01remove-initramfs-fsck2.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Add: initrd /initrd.img /boot/initrd-fsck-patch2.img :to bootloader configuration'

echo ''
exit 0
