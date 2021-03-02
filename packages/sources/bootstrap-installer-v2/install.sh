#!/bin/sh
# bootstrap-installer package
# install script

# Settings
PACKAGE_DIR="$(dirname "${0}")"
PACKAGE_NAME='bootstrap-installer'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e './usr/local/etc' ] || [ ! -e './usr/local/sbin' ] || [ ! -e './usr/local/share' ]; then
	echo './usr/local/etc or'
	echo './usr/local/sbin or'
	echo './usr/local/share not exists'
	exit 1
fi

# Splash, question
if [ ! "${1}" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ' ! DO NOT INSTALL THIS PACKAGE ON A RUNNING OS'
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/etc
for i in bootstrap-installer.rc bootstrap-installer-repos.rc; do
	echo -n "[ln] etc/${i} ./usr/local/etc"
		ln -s "$(realpath --strip --relative-to="./usr/local/etc" "${PACKAGE_DIR}/etc/${i}")" ./usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/sbin
echo -n '[ln] sbin/bootstrap-installer.sh ./usr/local/sbin'
	ln -s "$(realpath --strip --relative-to="./usr/local/sbin" "${PACKAGE_DIR}/sbin/bootstrap-installer.sh")" ./usr/local/sbin/bootstrap-installer.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
echo -n '[ln] share/bootstrap-installer ./usr/local/share'
	ln -s "$(realpath --strip --relative-to="./usr/local/share" "${PACKAGE_DIR}/share/bootstrap-installer")" ./usr/local/share/bootstrap-installer > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
