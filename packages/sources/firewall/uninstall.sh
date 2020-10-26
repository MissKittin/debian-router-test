#!/bin/sh
# firewall package
# uninstall script
# This script has command line tweaks

# Settings
PACKAGE_NAME='firewall' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
	if [ ! -e /usr/local/etc/firewall ] || [ ! -e /usr/local/etc/firewall6 ] || [ ! -e /usr/local/sbin/firewall.sh ] || [ ! -e /usr/local/sbin/firewall6.sh ]; then
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
for i in firewall firewall6; do
	echo -n '[rm] /usr/local/etc/'"${i}"
		rm ${PREFIX}/usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/firewall'
	rm ${PREFIX}/usr/local/etc/init.d/firewall > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
for i in firewall.sh firewall6.sh; do
	echo -n '[rm] /usr/local/sbin/'"${i}"
		rm ${PREFIX}/usr/local/sbin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/firewall'
	rm ${PREFIX}/etc/init.d/firewall > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/firewall from /etc/rc*.d'

echo ''
exit 0
