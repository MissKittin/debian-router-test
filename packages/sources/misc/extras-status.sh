#!/bin/sh
# misc package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='misc'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/notify-daemon
for i in apt-update.rc etc-trash.rc obsolete-kernels.rc ssh.rc smart.rc; do
	echo -n "/usr/local/etc/notify-daemon/events.rc.d/${i}"
		if [ -L /usr/local/etc/notify-daemon/events.rc.d/${i} ] && [ -e /usr/local/etc/notify-daemon/events.rc.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done
for i in cpu.rc; do
	echo -n "/usr/local/etc/notify-daemon/critical-events.rc.d/${i}"
		if [ -L /usr/local/etc/notify-daemon/critical-events.rc.d/${i} ] && [ -e /usr/local/etc/notify-daemon/critical-events.rc.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /usr/local/share/rc.local.d
for i in cpufreq.rc dmesg-dump.rc zz-fs-ssd-tweaks.rc set-sensors.rc vram.rc zram.rc; do
	echo -n "/usr/local/etc/rc.local.d/${i}"
		if [ -L /usr/local/etc/rc.local.d/P*_${i} ] && [ -e /usr/local/etc/rc.local.d/P*_${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# Notify
echo ''
if $broken && $installed; then
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
