#!/bin/sh
# ntpdate-daemon package
# install script
# This script has command line tweaks

# Debian dependencies: ntpdate

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='ntpdate-daemon'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Dump command line
PREFIX=''
FORCE='false'
for i in "${@}"; do
	case "${i}" in
		--prefix=*)
			PREFIX="${i#--prefix=}"
		;;
		--package-dir=*)
			PACKAGE_DIR="${i#--package-dir=}"
		;;
		'--force')
			FORCE='true'
		;;
	esac
done

# Check environment
if [ ! -e ${PREFIX}/usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check installed packages
if [ ! -e /usr/sbin/ntpdate ]; then
	echo 'ntpdate debian package not installed'
	exit 1
fi

# Check if installed
if [ "${PREFIX}" = '' ]; then
	if [ -e /usr/local/sbin/ntpdate-daemon.sh ] || [ -e /etc/init.d/ntpdate-daemon.sh ]; then
		echo 'Already installed'
		exit 1
	fi
fi

# Splash # Question
if ! ${FORCE}; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/etc
cd ${PREFIX}/usr/local/etc
echo -n '[ln] etc/ntpdate-daemon.rc /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/ntpdate-daemon.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd ${PREFIX}/usr/local/etc/init.d
echo -n '[ln] etc/init.d/ntpdate-daemon.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/ntpdate-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd ${PREFIX}/usr/local/sbin
echo -n '[ln] sbin/ntpdate-daemon.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/ntpdate-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd ${PREFIX}/etc/init.d
echo -n '[ln] /usr/local/etc/init.d/ntpdate-daemon.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/ntpdate-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv ntpdate-daemon.sh'
echo '  or install-extras.sh'

echo ''
exit 0
