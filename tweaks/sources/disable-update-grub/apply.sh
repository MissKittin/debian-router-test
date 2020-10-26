#!/bin/sh
# Simple hack

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

chmod 644 /etc/kernel/postinst.d/zz-update-grub
chmod 644 /etc/kernel/postrm.d/zz-update-grub

exit 0
