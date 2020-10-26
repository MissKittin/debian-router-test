#!/bin/sh
installed=false
broken=false
echo ''

for i in /usr/local/etc/apt/apt.conf.d/99-autoremove-suggests /usr/local/etc/apt/apt.conf.d/99-no-apt-translations /usr/local/etc/apt/apt.conf.d/99-no-install-recommends /etc/apt/apt.conf.d/99-autoremove-suggests /etc/apt/apt.conf.d/99-no-apt-translations /etc/apt/apt.conf.d/99-no-install-recommends; do
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
