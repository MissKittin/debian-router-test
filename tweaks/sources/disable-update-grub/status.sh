#!/bin/sh
installed=false
broken=false
echo ''

for i in /etc/kernel/postinst.d/zz-update-grub /etc/kernel/postrm.d/zz-update-grub; do
	echo -n "${i}"
		if [ -x ${i} ]; then
			broken=true
			echo ' [Broken]'
		else
			installed=true
			echo ' [ OK ]'
		fi
done

# Notify
echo ''
if $broken && $installed; then
	echo ' Tweak partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Tweak installed'
	exit 0
else
	echo ' Tweak not installed'
	exit 1
fi
