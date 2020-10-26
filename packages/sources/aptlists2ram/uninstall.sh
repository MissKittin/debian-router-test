#!/bin/sh
# aptlists2ram package
# uninstall script

# Settings
PACKAGE_NAME='aptlists2ram' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /usr/local/etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ] || [ ! -e /usr/local/etc/rc.local.d/P*_aptlists2ram.rc ] || [ ! -e /usr/local/etc/rc.local.d/*_aptlists2ram.rc ] || [ ! -e /etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ]; then
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

# Uninstall - /usr/local/etc/rc.local.d
echo -n '[rm] /usr/local/etc/rc.local.d/aptlists2ram.rc'
	rm /usr/local/etc/rc.local.d/P*_aptlists2ram.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/rcdown.local.d
echo -n '[rm] /usr/local/etc/rcdown.local.d/aptlists2ram.rc'
	rm /usr/local/etc/rcdown.local.d/*_aptlists2ram.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' 

# Uninstall - /usr/local/etc/apt/apt.conf.d
echo -n '[rm] /usr/local/etc/apt/apt.conf.d/aptlists2ram-compress-indexes'
	rm /usr/local/etc/apt/apt.conf.d/02aptlists2ram-compress-indexes > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/apt/apt.conf.d
echo -n '[rm] /etc/apt/apt.conf.d/aptlists2ram-compress-indexes'
	rm /etc/apt/apt.conf.d/02aptlists2ram-compress-indexes > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
