#!/bin/sh
# misc package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='misc'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
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

# Install - /usr/local/etc/dnsmasq.d
if cd /usr/local/etc/dnsmasq.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/dnsmasq.d/ddns.conf /usr/local/etc/dnsmasq.d'
		ln -s ${PACKAGE_DIR}/extras/etc/dnsmasq.d/ddns.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

	# Install - /etc/dnsmasq.d
	if cd /etc/dnsmasq.d > /dev/null 2>&1; then
		echo -n '[ln] /usr/local/etc/dnsmasq.d/ddns.conf /etc/dnsmasq.d'
			ln -s /usr/local/etc/dnsmasq.d/ddns.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo 'Install dnsmasq'
	fi
else
	echo 'Create /usr/local/etc/dnsmasq.d directory'
fi

# Install - /usr/local/etc/notify-daemon
if cd /usr/local/etc/notify-daemon/events.rc.d > /dev/null 2>&1; then
	for i in apt-update.rc dpkg_rubbish.rc obsolete-kernels.rc ssh.rc smart.rc; do
		echo -n "[ln] extras/etc/notify-daemon/events.rc.d/${i} /usr/local/etc/notify-daemon/events.rc.d"
			if [ -e "/usr/local/etc/notify-daemon/events.rc.d/${i}" ]; then
				echo ' [EXISTS]'
			else
				ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/events.rc.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi
	done
	cd /usr/local/etc/notify-daemon/critical-events.rc.d
	for i in cpu.rc; do
		echo -n "[ln] extras/etc/notify-daemon/critical-events.rc.d/${i} /usr/local/etc/notify-daemon/critical-events.rc.d"
			if [ -e "/usr/local/etc/notify-daemon/critical-events.rc.d/${i}" ]; then
				echo ' [EXISTS]'
			else
				ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/critical-events.rc.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi
	done
else
	echo 'notify-daemon is not installed'
fi

# Install - /usr/local/etc/rc.local.d
if cd /usr/local/etc/rc.local.d > /dev/null 2>&1; then
	for i in cpufreq.rc fs-hdd.rc set-sensors.rc zram.rc; do
		echo -n "[ln] extras/etc/rc.local.d/${i} /usr/local/etc/rc.local.d"
			ln -s ${PACKAGE_DIR}/extras/etc/rc.local.d/PKx_${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	done
else
	echo 'rc.local is not installed'
fi

# Notification
echo ''
echo ' ! Configure /usr/local/etc/rc.local.d'

echo ''
exit 0
