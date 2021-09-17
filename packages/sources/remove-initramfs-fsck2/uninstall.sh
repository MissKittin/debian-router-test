#!/bin/sh
# remove-initramfs-fsck2 tweak
# uninstall script

# Settings
PACKAGE_NAME='remove-initramfs-fsck2' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /boot/initrd-fsck-patch2.img ] || [ ! -e /usr/local/etc/init.d/remove-initramfs-fsck2.sh ] || [ ! -e /etc/init.d/remove-initramfs-fsck2.sh ]; then
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

# Uninstall - /boot
echo -n '[rm] /boot/initrd-fsck-patch2.img'
	rm /boot/initrd-fsck-patch2.img > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/remove-initramfs-fsck2.sh'
	rm /usr/local/etc/init.d/remove-initramfs-fsck2.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/remove-initramfs-fsck2.sh'
	rm /etc/init.d/remove-initramfs-fsck2.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rcS.d
echo -n '[rm] /etc/rcS.d/remove-initramfs-fsck2.sh'
	rm /etc/rcS.d/*remove-initramfs-fsck2.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove: /boot/initrd-fsck-patch2.img :from bootloader configuration'

echo ''
exit 0
