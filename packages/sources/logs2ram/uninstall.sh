#!/bin/sh
# logs2ram package
# uninstall script

# Settings
PACKAGE_NAME='logs2ram' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /usr/local/etc/init.d/logs2ram.sh ] || [ ! -e /etc/init.d/logs2ram.sh ]; then
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

# Uninstall - /usr/local/etc/init.d
for i in logs2ram.sh zlogs2ram-sync.sh; do
	echo -n "[rm] /usr/local/etc/init.d/etc/init.d/${i}"
		rm /usr/local/etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/init.d
for i in logs2ram.sh zlogs2ram-sync.sh; do
	echo -n "[rm] /etc/init.d/${i}"
		rm /etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninsserv - /etc/rcS.d
cd /etc/rcS.d
echo -n '[rm] /etc/rcS.d/*logs2ram.sh'
	rm /etc/rcS.d/*logs2ram.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rc0.d rc6.d
for i in logs2ram.sh zlogs2ram-sync.sh; do
	echo -n "[rm] /etc/rc0.d/${i}"
		rm /etc/rc0.d/*${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	echo -n "[rm] /etc/rc6.d/${i}"
		rm /etc/rc6.d/*${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
