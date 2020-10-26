#!/bin/sh
# hdd-autospindown package
# uninstall script
# This script has command line tweaks

# Settings
PACKAGE_NAME='hdd-autospindown'

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
	if [ ! -e /usr/local/etc/hdd-autospindown.d ] || [ ! -e /usr/local/etc/hdd-autospindown.rc ] || [ ! -e /usr/local/sbin/hdd-autospindown.sh ]; then
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
for i in hdd-autospindown.d hdd-autospindown.rc; do
	echo -n '[rm] /usr/local/etc/'"${i}"
		rm ${PREFIX}/usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/hdd-autospindown.sh'
	rm ${PREFIX}/usr/local/etc/init.d/hdd-autospindown.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/hdd-autospindown.sh'
	rm ${PREFIX}/usr/local/sbin/hdd-autospindown.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/hdd-autospindown.sh'
	rm ${PREFIX}/etc/init.d/hdd-autospindown.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/hdd-autospindown.sh from /etc/rc*.d'

echo ''
exit 0
