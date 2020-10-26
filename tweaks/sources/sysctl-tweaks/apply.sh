#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/sysctl.d ]; then
	echo 'Create /usr/local/etc/sysctl.d'
	exit 1
fi

# Check if is installed
if [ -e /usr/local/etc/sysctl.d/ddos.conf ] || [ -e /usr/local/etc/sysctl.d/disable_watchdog.conf ] || [ -e /usr/local/etc/sysctl.d/hardening.conf ] || [ -e /usr/local/etc/sysctl.d/writeback_time.conf ] || [ -e /etc/sysctl.d/ddos.conf ] || [ -e /etc/sysctl.d/disable_watchdog.conf ] || [ -e /etc/sysctl.d/writeback_time.conf ]; then
	echo 'Already installed'
	exit 1
fi

if cd /usr/local/etc/rc.local.d > /dev/null 2>&1; then
	echo -n '[ln] etc/rc.local.d/S01_hardening.rc /usr/local/etc/rc.local.d'
		ln -s ${PACKAGE_DIR}/etc/rc.local.d/S01_hardening.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
else
	echo '[ln] etc/rc.local.d/S01_hardening.rc /usr/local/etc/rc.local.d [Fail]'
fi

cd /usr/local/etc/sysctl.d
for i in ddos.conf disable_watchdog.conf hardening.conf writeback_time.conf; do
	echo -n "[ln] etc/sysctl.d/${i} /usr/local/etc/sysctl.d"
		ln -s ${PACKAGE_DIR}/etc/sysctl.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

cd /etc/sysctl.d
for i in ddos.conf disable_watchdog.conf hardening.conf writeback_time.conf; do
	echo -n "[ln] /usr/local/etc/sysctl.d/${i} /etc/sysctl.d"
		ln -s /usr/local/etc/sysctl.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
