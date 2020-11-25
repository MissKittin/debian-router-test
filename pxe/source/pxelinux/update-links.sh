#!/bin/sh

if [ ! "`whoami`" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi

destination="$(dirname "$(readlink -f "${0}")")"

######################################################
# memdisk
cd ${destination}/memdisk
rm memdisk > /dev/null 2>&1
ln -s /usr/lib/syslinux/memdisk .
######################################################

######################################################
# syslinux modules
cd ${destination}/modules
rm * > /dev/null 2>&1
ln -s /usr/lib/syslinux/modules/bios/* .
######################################################

######################################################
# pxelinux core
cd ${destination}/pxelinux
rm * > /dev/null 2>&1
ln -s /usr/lib/PXELINUX/* .
######################################################

######################################################
# pxelinux root - clean
cd ${destination}/root
rm * > /dev/null 2>&1

# pxelinux root - modules
cd ${destination}/modules
for i in *; do
	cd ${destination}/root
	ln -s ../../pxelinux/modules/${i} .
done

# pxelinux root - core
cd ${destination}/pxelinux
for i in *; do
	cd ${destination}/root
	ln -s ../../pxelinux/pxelinux/${i} .
done

# pxelinux root - menu
cd ${destination}/root
ln -s ../../pxelinux/pxelinux.cfg .

# pxelinux root - pxe root
cd ${destination}/root
ln -s ${destination%/*}/root .

# pxelinux root - memdisk
cd ${destination}/root
ln -s ../../pxelinux/memdisk/memdisk .
######################################################

exit 0
