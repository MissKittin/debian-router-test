#!/bin/sh
# logs2ram package
# install script

# Debian dependencies: sysvinit-core

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='logs2ram'

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
if [ ! -e /usr/share/sysvinit ]; then
	echo 'sysvinit-core debian package not installed'
	sleep 1
fi

# Check if installed
if [ -e /usr/local/etc/init.d/logs2ram.sh ] || [ -e /etc/init.d/logs2ram.sh ]; then
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

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/logs2ram.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/logs2ram.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d/
for i in logs2ram.sh zlogs2ram-sync.sh; do
	echo -n "[ln] /usr/local/etc/init.d/${i} /etc/init.d"
		ln -s /usr/local/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Insserv - /etc/rcS.d
cd /etc/rcS.d
echo -n '[ln] /etc/init.d/logs2ram.sh /etc/rcS.d
	ln -s ../init.d/logs2ram.sh S01logs2ram.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Insserv - /etc/rc0.d rc6.d
for i in logs2ram.sh zlogs2ram-sync.sh; do
	cd /etc/rc0.d
	echo -n "[ln] /etc/init.d/${i} /etc/rc0.d"
		ln -s /etc/init.d/${i} ./K01${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	cd /etc/rc6.d
	echo -n "[ln] /etc/init.d/${i} /etc/rc6.d"
		ln -s /etc/init.d/${i} ./K01${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
