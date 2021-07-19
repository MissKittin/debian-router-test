#!/bin/sh
# desktop-splashscreen package
# install script

# Debian dependencies: fbi

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='desktop-splashscreen'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/bin/fbi ]; then
	echo 'fbi debian package not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check if installed
for i in etc/desktop-splashscreen etc/init.d/aasplashscreen-boot etc/init.d/aasplashscreen-shutdown etc/init.d/zsplashscreen-stop; do
	if [ -e /usr/local/${i} ]; then
		echo 'Already installed'
		exit 1
	fi
done
for i in etc/init.d/aasplashscreen-boot etc/init.d/aasplashscreen-shutdown etc/init.d/zsplashscreen-stop; do
	if [ -e /${i} ]; then
		echo 'Already installed'
		exit 1
	fi
done

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
echo -n '[ln] etc/desktop-splashscreen /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/desktop-splashscreen . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
for i in aasplashscreen-boot aasplashscreen-shutdown zsplashscreen-stop; do
	echo -n "[ln] etc/init.d/${i} /usr/local/etc/init.d"
		ln -s ${PACKAGE_DIR}/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc/init.d
cd /etc/init.d
for i in aasplashscreen-boot aasplashscreen-shutdown zsplashscreen-stop; do
	echo -n "[ln] /usr/local/etc/init.d/${i} /etc/init.d/${i}"
		ln -s /usr/local/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc/rcS.d
cd /etc/rcS.d
echo -n '[ln] /etc/init.d/aasplashscreen-boot /etc/rcS.d'
	ln -s ../init.d/aasplashscreen-boot ./S00aasplashscreen-boot > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]

# Install - /etc/rc2345.d
for i in 2 3 4 5; do
	cd /etc/rc${i}.d
	echo -n "[ln] /etc/init.d/zsplashscreen-stop /etc/rc${i}.d"
		ln -s ../init.d/zsplashscreen-stop ./S99zsplashscreen-stop > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]
done

# Install - /etc/rc06.d
for i in 0 6; do
	cd /etc/rc${i}.d
	echo -n "[ln] /etc/init.d/aasplashscreen-shutdown /etc/rc${i}.d"
		ln -s ../init.d/aasplashscreen-shutdown ./K00aasplashscreen-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]
done

echo ''
exit 0
