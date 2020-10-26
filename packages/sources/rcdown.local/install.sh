#!/bin/sh
# rcdown.local package
# install script

# Debian dependencies: initscripts

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='rcdown.local'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ ! -e /etc/init.d/.legacy-bootordering ]; then
	echo '/etc/init.d/.legacy-bootordering not exists'
	echo 'Legacy bootordering is required'
	exit 1
fi

# Check installed packages
if [ ! -e /etc/init.d/rc.local ]; then
	echo 'initscripts debian package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/rcdown.local ] || [ -e /usr/local/etc/rcdown.local.d ] || [ -e /usr/local/etc/init.d/arcdown.local ] || [ -e /etc/init.d/arcdown.local ]; then
	echo 'Already installed'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/rcdown.local /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/rcdown.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] etc/rcdown.local.d /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/rcdown.local.d . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/arcdown.local /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/arcdown.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/arcdown.local /etc/init.d'
	ln -s /usr/local/etc/init.d/arcdown.local . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Insserv - /etc/rc6.d, /etc/rc0.d
for i in rc6.d rc0.d; do
	cd /etc/$i
	echo -n '[ln] /etc/init.d/arcdown.local /etc/'"$i"
		ln -s ../init.d/arcdown.local ./K01arcdown.local > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
