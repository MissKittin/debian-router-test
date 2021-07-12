#!/bin/sh
# desktop-toolbox package
# extras uninstall script

# Settings
PACKAGE_NAME='desktop-toolbox'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/bin
for i in apt-check apt-updater; do
	echo -n "[rm] /usr/local/bin/${i}"
		if [ -e "/usr/local/bin/${i}" ]; then
			rm /usr/local/bin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/apt-updaterd.rc'
	if [ -e '/usr/local/etc/apt-updaterd.rc' ]; then
		rm /usr/local/etc/apt-updaterd.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/etc/desktop-toolbox
echo -n '[rm] /usr/local/etc/desktop-toolbox/mod_apt-updater.rc'
	if [ -e '/usr/local/etc/desktop-toolbox/mod_apt-updater.rc' ]; then
		rm /usr/local/etc/desktop-toolbox/mod_apt-updater.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/apt-updaterd'
	if [ -e '/usr/local/etc/init.d/apt-updaterd' ]; then
		rm /usr/local/etc/init.d/apt-updaterd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/apt-updaterd'
	if [ -e '/usr/local/sbin/apt-updaterd' ]; then
		rm /usr/local/sbin/apt-updaterd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/share/desktop-toolbox
for i in mod_apt-updater.rc mod_apt-updater.lang.d; do
	echo -n "[rm] /usr/local/share/desktop-toolbox/${i}"
		if [ -e "/usr/local/share/desktop-toolbox/${i}" ]; then
			rm /usr/local/share/desktop-toolbox/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/apt-updaterd'
	if [ -e '/etc/init.d/apt-updaterd' ]; then
		rm /etc/init.d/apt-updaterd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/apt-updaterd from /etc/rc*.d'

echo ''
exit 0
