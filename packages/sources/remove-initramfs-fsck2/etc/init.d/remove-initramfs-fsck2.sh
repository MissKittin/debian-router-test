#!/bin/sh
### BEGIN INIT INFO
# Provides:          remove-initramfs-fsck
# Required-Start:
# Required-Stop:     checkroot
# Should-Start:
# Default-Start:     S
# Default-Stop:
# Short-Description: Removes /run/initramfs/fsck-root
# Description:       Allows checkroot.sh to check the root partition
#                    if initrd-fsck-patch.img is applied.
### END INIT INFO

if [ -e /run/initramfs/fsck-root ] && [ -e /run/initramfs/no-fsck ]; then
	rm /run/initramfs/fsck-root
	[ -e /run/initramfs/fsck.log ] && rm /run/initramfs/fsck.log
fi

exit 0
