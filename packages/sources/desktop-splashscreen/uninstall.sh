#!/bin/sh
# desktop-splashscreen package
# uninstall script

# Settings
PACKAGE_NAME='desktop-splashscreen'

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
for i in etc/desktop-splashscreen etc/init.d/aasplashscreen-boot etc/init.d/aasplashscreen-shutdown etc/init.d/zsplashscreen-stop; do
	if [ ! -e /usr/local/${i} ]; then
		echo 'Not installed'
		exit 1
	fi
done
for i in etc/init.d/aasplashscreen-boot etc/init.d/aasplashscreen-shutdown etc/init.d/zsplashscreen-stop; do
	if [ ! -e /${i} ]; then
		echo 'Not installed'
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

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/desktop-splashscreen'
	rm /usr/local/etc/desktop-splashscreen > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
for i in aasplashscreen-boot aasplashscreen-shutdown zsplashscreen-stop; do
	echo -n "[rm] /usr/local/etc/init.d/${i}"
		rm /usr/local/etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/init.d
for i in aasplashscreen-boot aasplashscreen-shutdown zsplashscreen-stop; do
	echo -n "[rm] /etc/init.d/${i}"
		rm /etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/rcS.d
echo -n '[rm] /etc/init.d/aasplashscreen-boot'
	rm /etc/init.d/*aasplashscreen-boot > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]

# Uninstall - /etc/rc2345.d
for i in 2 3 4 5; do
	echo -n "[rm] /etc/rc${i}.d/zsplashscreen-stop"
		rm /etc/rc${i}.d/*zsplashscreen-stop > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]
done

# Uninstall - /etc/rc06.d
for i in 0 6; do
	echo -n "[rm] /etc/rc${i}.d/aasplashscreen-shutdown"
		rm /etc/rc${i}.d/*aasplashscreen-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]
done

echo ''
exit 0
