#!/bin/sh
installed=false
broken=false
echo ''

for i in /usr/local/etc/sudoers.d/nodns /etc/sudoers.d/nodns /usr/local/etc/sudoers.d/nolecture /etc/sudoers.d/nolecture; do
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
