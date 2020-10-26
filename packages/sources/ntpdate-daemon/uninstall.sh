#!/bin/sh
# ntpdate-daemon package
# uninstall script
# This script has command line tweaks

# Settings
PACKAGE_NAME='ntpdate-daemon'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Dump command line
PREFIX=''
for i in "${@}"; do
	case "${i}" in
		--prefix=*)
			PREFIX="${i#--prefix=}"
		;;
	esac
done

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
if [ "${PREFIX}" = '' ]; then
	if [ ! -e /usr/local/sbin/ntpdate-daemon.sh ] || [ ! -e /usr/local/etc/ntpdate-daemon.rc ]; then
		echo 'Not installed'
		exit 1
	fi
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
echo -n '[rm] /usr/local/etc/ntpdate-daemon.rc'
	rm ${PREFIX}/usr/local/etc/ntpdate-daemon.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/ntpdate-daemon.sh'
	rm ${PREFIX}/usr/local/etc/init.d/ntpdate-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/ntpdate-daemon.sh'
	rm ${PREFIX}/usr/local/sbin/ntpdate-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/ntpdate-daemon.sh'
	rm ${PREFIX}/etc/init.d/ntpdate-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/ntpdate-daemon.sh from /etc/rc*.d'

echo ''
exit 0
