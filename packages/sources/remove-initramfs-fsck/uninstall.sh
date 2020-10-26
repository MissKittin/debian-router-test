#!/bin/sh
# remove-initramfs-fsck tweak
# uninstall script

# Settings
PACKAGE_NAME='remove-initramfs-fsck' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /boot/initrd-fsck-patch.img ] || [ ! -e /usr/local/etc/init.d/remove-initramfs-fsck.sh ] || [ ! -e /etc/init.d/remove-initramfs-fsck.sh ]; then
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
echo -n '[rm] /boot/initrd-fsck-patch.img'
	rm /boot/initrd-fsck-patch.img > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/remove-initramfs-fsck.sh'
	rm /usr/local/etc/init.d/remove-initramfs-fsck.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/remove-initramfs-fsck.sh'
	rm /etc/init.d/remove-initramfs-fsck.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rcS.d
echo -n '[rm] /etc/rcS.d/remove-initramfs-fsck.sh'
	rm /etc/rcS.d/*remove-initramfs-fsck.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove: /boot/initrd-fsck-patch.img :from bootloader configuration'

echo ''
exit 0
