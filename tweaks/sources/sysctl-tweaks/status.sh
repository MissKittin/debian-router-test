#!/bin/sh
installed=false
broken=false
echo ''

echo -n '/usr/local/etc/rc.local.d/S01_hardening.rc'
	if [ -L '/usr/local/etc/rc.local.d/S01_hardening.rc' ] && [ -e '/usr/local/etc/rc.local.d/S01_hardening.rc' ]; then
		echo ' [ OK ]'
	else
		echo ' [Broken]'
	fi

for i in /usr/local/etc/sysctl.d/ddos.conf /usr/local/etc/sysctl.d/disable_watchdog.conf /usr/local/etc/sysctl.d/hardening.conf /usr/local/etc/sysctl.d/writeback_time.conf /etc/sysctl.d/ddos.conf /etc/sysctl.d/disable_watchdog.conf /etc/sysctl.d/hardening.conf /etc/sysctl.d/writeback_time.conf; do
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
