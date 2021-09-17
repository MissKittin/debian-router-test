#!/bin/sh
# remove-initramfs-fsck tweak
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='remove-initramfs-fsck'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/remove-initramfs-fsck2.sh'
	if [ -L /usr/local/etc/init.d/remove-initramfs-fsck2.sh ] && [ -e /usr/local/etc/init.d/remove-initramfs-fsck2.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/remove-initramfs-fsck2.sh'
	if [ -L /etc/init.d/remove-initramfs-fsck2.sh ] && [ -e /etc/init.d/remove-initramfs-fsck2.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /boot
echo -n '/boot/initrd-fsck-patch2.img'
	if [ -L /boot/initrd-fsck-patch2.img ] && [ -e /boot/initrd-fsck-patch2.img ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

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
