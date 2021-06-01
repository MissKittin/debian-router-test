#!/bin/sh
installed=false
broken=false
echo ''

for i in /usr/local/etc/polkit-1/localauthority/50-local.d/allow_everything.pkla /etc/polkit-1/localauthority/50-local.d/allow_everything.pkla; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
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
