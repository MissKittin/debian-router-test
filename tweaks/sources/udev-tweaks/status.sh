#!/bin/sh
installed=false
broken=false
echo ''

for i in /usr/local/etc/udev/rules.d/hd_power_save.rules /usr/local/etc/udev/rules.d/pci_pm.rules /etc/udev/rules.d/hd_power_save.rules /etc/udev/rules.d/pci_pm.rules; do
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
