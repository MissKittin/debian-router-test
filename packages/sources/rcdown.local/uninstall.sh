#!/bin/sh
# rcdown.local package
# uninstall script

# Settings
PACKAGE_NAME='rcdown.local' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /usr/local/etc/rcdown.local ] || [ ! -e /usr/local/etc/rcdown.local.d ] || [ ! -e /usr/local/etc/init.d/arcdown.local ] || [ ! -e /etc/init.d/arcdown.local ]; then
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

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/arcdown.local'
	rm /etc/init.d/arcdown.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/rcdown.local'
	rm /usr/local/etc/rcdown.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rm] /usr/local/etc/rcdown.local.d'
	rm /usr/local/etc/rcdown.local.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/arcdown.local'
	rm /usr/local/etc/init.d/arcdown.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rc6.d
echo -n '[rm] /etc/rc6.d/rcdown.local'
	rm /etc/rc6.d/*rcdown.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rc0.d
echo -n '[rm] /etc/rc0.d/rcdown.local'
	rm /etc/rc0.d/*rcdown.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
