#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e /usr/local/etc/sysctl.d/ddos.conf ] || [ ! -e /usr/local/etc/sysctl.d/disable_watchdog.conf ] || [ -e /usr/local/etc/sysctl.d/hardening.conf ] || [ ! -e /usr/local/etc/sysctl.d/writeback_time.conf ] || [ ! -e /etc/sysctl.d/ddos.conf ] || [ ! -e /etc/sysctl.d/disable_watchdog.conf ] || [ ! -e /etc/sysctl.d/writeback_time.conf ]; then
	echo 'Not installed'
	exit 1
fi

echo -n '[rm] /usr/local/etc/rc.local.d/S01_hardening.rc'
	rm /usr/local/etc/rc.local.d/S01_hardening.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

for i in ddos.conf disable_watchdog.conf hardening.conf writeback_time.conf; do
	echo -n "[rm] /usr/local/etc/sysctl.d/${i}"
		rm /usr/local/etc/sysctl.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

for i in ddos.conf disable_watchdog.conf hardening.conf writeback_time.conf; do
	echo -n "[rm] /etc/sysctl.d/${i}"
		rm /etc/sysctl.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
