#!/bin/sh
installed=false
broken=false
echo ''

for i in /etc/default/hwclock /etc/default/hwclock; do
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
