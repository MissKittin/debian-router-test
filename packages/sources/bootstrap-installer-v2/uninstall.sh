#!/bin/sh
# bootstrap-installer package
# uninstall script

# Settings
PACKAGE_NAME='bootstrap-installer'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash, question
if [ ! "${1}" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc
for i in bootstrap-installer.rc bootstrap-installer-repos.rc; do
	echo -n "[rm] ./usr/local/etc/${i}"
		rm ./usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/sbin
echo -n '[rm] ./usr/local/sbin/bootstrap-installer.sh'
	rm ./usr/local/sbin/bootstrap-installer.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] ./usr/local/share/bootstrap-installer'
	rm ./usr/local/share/bootstrap-installer > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
