#!/bin/sh
# mkkernelsqs.sh automation

if [ "$1" = '' ]; then
	echo 'usage: update-current-kernel.sh sqs-patch-name'
	exit 1
fi

if check-kernel-update.sh > /dev/null 2>&1; then
	make-kernel-image "linux-image-$(ls /boot/version.txt-* | sed -e 's\/boot/version.txt-\\g')" ${1}
else
	echo 'aborted. for more info run check-kernel-update.sh'
fi

exit 0
