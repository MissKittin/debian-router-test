#!/bin/sh
# Memdisk kernel is linked manually

if [ ! "`whoami`" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
if [ "$1" = '' ]; then
	echo 'No destination (use absolute path)'
	exit 1
fi

######################################################
# syslinux modules
cd ${1}/modules
rm *
ln -s /usr/lib/syslinux/modules/bios/* .
######################################################

######################################################
# pxelinux core
cd ${1}/pxelinux
rm *
ln -s /usr/lib/PXELINUX/* .
######################################################

######################################################
# pxelinux root - clean
cd ${1}/root
rm *

# pxelinux root - modules
cd ${1}/modules
for i in *; do
	cd ${1}/root
	ln -s ../../pxelinux/modules/${i} .
done

# pxelinux root - core
cd ${1}/pxelinux
for i in *; do
	cd ${1}/root
	ln -s ../../pxelinux/pxelinux/${i} .
done

# pxelinux root - menu
cd ${1}/root
ln -s ../../pxelinux/pxelinux.cfg .

# pxelinux root - pxe root
cd ${1}/root
ln -s /home/pxe/root .
######################################################

######################################################
# pxelinux root - memdisk
cd ${1}/root
ln -s ../../pxelinux/memdisk/memdisk .
######################################################

exit 0
