#!/bin/sh
# rc.local package
# uninstall script

# Settings
PACKAGE_NAME='rc.local' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /etc/init.d/rc.local ]; then
	echo 'rc.local init script not found'
	exit 1
fi
if [ ! -e /etc/rc.local ] || [ ! -e /usr/local/etc/rc.local ] || [ ! -e /usr/local/etc/rc.local.d ]; then
	echo 'Not installed'
	exit 1
fi
if [ ! -e /etc/rc.local.old ] || [ ! -e /etc/init.d/rc.local.old ]; then
	echo 'Backup files not found'
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

# Uninstall - /etc
echo -n '[rm] /etc/rc.local'
	rm /etc/rc.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/rc.local.old /etc/rc.local'
	mv /etc/rc.local.old /etc/rc.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/rc.local'
	rm /etc/init.d/rc.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/init.d/rc.local.old /etc/rc.local'
	mv /etc/init.d/rc.local.old /etc/init.d/rc.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/rc.local'
	rm /usr/local/etc/rc.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rm] /usr/local/etc/rc.local.d'
	rm /usr/local/etc/rc.local.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/rc.local'
	rm /usr/local/etc/init.d/rc.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
