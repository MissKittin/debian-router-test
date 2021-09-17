#!/bin/sh
# misc package
# uninstall script

# Settings
PACKAGE_NAME='misc' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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

# Check environment
if [ ! -e /etc/issue.old ] || [ ! -e /etc/motd.old ]; then
	echo 'Backup files not found'
	exit 1
fi

# Check if installed
if [ ! -e /usr/local/sbin/set-zram.sh ]; then
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
for i in issue motd; do
	echo -n '[rm] /usr/local/etc/'"${i}"
		rm /usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/sbin
for i in set-zram.sh; do
	echo -n '[rm] /usr/local/sbin/'"${i}"
		rm /usr/local/sbin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc
cd /etc
for i in issue motd; do
	echo -n '[rm] /etc/'"${i}"
		rm /etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	echo -n '[mv] /etc/'"${i}"'.old /etc/'"${i}"
		mv ${i}.old ${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
