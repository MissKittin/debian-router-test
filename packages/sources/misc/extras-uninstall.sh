#!/bin/sh
# misc package
# extras uninstall script

# Settings
PACKAGE_NAME='misc'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc/notify-daemon
for i in apt-update.rc etc-trash.rc obsolete-kernels.rc ssh.rc smart.rc; do
	echo -n "[rm] /usr/local/etc/notify-daemon/events.rc.d/${i}"
		if [ -e "/usr/local/etc/notify-daemon/events.rc.d/${i}" ]; then
			rm /usr/local/etc/notify-daemon/events.rc.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done
for i in cpu.rc; do
	echo -n "[rm] /usr/local/etc/notify-daemon/critical-events.rc.d/${i}"
		if [ -e "/usr/local/etc/notify-daemon/critical-events.rc.d/${i}" ]; then
			rm /usr/local/etc/notify-daemon/critical-events.rc.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /usr/local/etc/rc.local.d
for i in cpufreq.rc dmesg-dump.rc zz-fs-ssd-tweaks.rc set-sensors.rc zram.rc; do
	echo -n "[rm] /usr/local/etc/rc.local.d/${i}"
		rm /usr/local/etc/rc.local.d/P*_${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
