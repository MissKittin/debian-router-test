#!/bin/sh
# desktop-toolbox package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='desktop-toolbox'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
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

# Install - /usr/local/bin
cd /usr/local/bin
for i in apt-updater; do
	echo -n "[ln] bin/${i} /usr/local/bin"
		if [ -e "/usr/local/bin/${i}" ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/bin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
done

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/apt-updaterd.rc /usr/local/etc'
	if [ -e '/usr/local/etc/apt-updaterd.rc' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/etc/apt-updaterd.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi

# Install - /usr/local/etc/desktop-toolbox
cd /usr/local/etc/desktop-toolbox
echo -n '[ln] etc/desktop-toolbox/mod_apt-updater.rc /usr/local/etc/desktop-toolbox'
	if [ -e '/usr/local/etc/desktop-toolbox/mod_apt-updater.rc' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/etc/desktop-toolbox/mod_apt-updater.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi

# Install - /usr/local/etc/init.d
if cd /usr/local/etc/init.d > /dev/null 2>&1; then
	echo -n '[ln] etc/init.d/apt-updaterd /usr/local/etc/init.d'
		if [ -e '/usr/local/etc/init.d/apt-updaterd' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/etc/init.d/apt-updaterd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi

	cd /etc/init.d
	echo -n '[ln] /usr/local/etc/init.d/apt-updaterd /etc/init.d'
		if [ -e '/etc/init.d/apt-updaterd' ]; then
			echo ' [EXISTS]'
		else
			ln -s /usr/local/etc/init.d/apt-updaterd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo '[ln] etc/init.d/apt-updaterd /usr/local/etc/init.d [Fail]'
fi

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/apt-updaterd /usr/local/sbin'
	if [ -e '/usr/local/sbin/apt-updaterd' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/sbin/apt-updaterd . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi

# Install - /usr/local/share/applications
if cd /usr/local/share/applications > /dev/null 2>&1; then
	for i in daemons.desktop; do
		echo -n "[ln] share/applications/${i} /usr/local/share/applications"
			if [ -e "/usr/local/share/applications/${i}" ]; then
				echo ' [EXISTS]'
			else
				ln -s ${PACKAGE_DIR}/extras/share/applications/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi
	done
else
	echo '[ln] share/applications/* /usr/local/share/applications [Fail]'
fi

# Install - /usr/local/share/desktop-toolbox
cd /usr/local/share/desktop-toolbox
for i in mod_apt-updater.rc mod_apt-updater.lang.d; do
	echo -n "[ln] share/desktop-toolbox/${i} /usr/local/share/desktop-toolbox"
		if [ -e "/usr/local/share/desktop-toolbox/${i}" ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/share/desktop-toolbox/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
done

# Notification
echo ''
echo ' ! Insserv /etc/init.d/apt-updaterd'

echo ''
exit 0
