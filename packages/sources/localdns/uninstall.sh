#!/bin/sh
# localdns package
# uninstall script

# Settings
PACKAGE_NAME='localdns' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
if [ ! -e /usr/local/etc/hosts.d ] || [ ! -e /usr/local/etc/init.d/dc_dnsmasq-hosts-build ] || [ ! -e /etc/init.d/dc_dnsmasq-hosts-build ] || [ ! -e /usr/local/sbin/generate-dns-hosts.sh ]; then
	echo 'Not installed'
	exit 1
fi

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# Question
echo -n 'Are you sure? (y/[n]) '
read answer
[ "${answer}" = 'y' ] || exit 0
echo ''

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/hosts.d'
	rm /usr/local/etc/hosts.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] etc/init.d/dc_dnsmasq-hosts-build /usr/local/etc/init.d'
	rm /usr/local/etc/init.d/dc_dnsmasq-hosts-build > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/dc_dnsmasq-hosts-build'
	rm /etc/init.d/dc_dnsmasq-hosts-build > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/generate-dns-hosts.sh'
	rm /usr/local/sbin/generate-dns-hosts.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/dc_dnsmasq-hosts-build from /etc/rc*.d'

echo ''
exit 0
