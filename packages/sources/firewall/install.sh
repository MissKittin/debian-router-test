#!/bin/sh
# firewall package
# install script
# This script has command line tweaks

# Dependencies: rc.local (not anymore)
# Debian dependencies: iptables
# Debian recommended: ebtables ipset

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='firewall'

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
#if [ ! -e ${PREFIX}/usr/local/etc/rc.local.d ]; then
#	echo 'rc.local package not installed'
#	exit 1
#fi
if [ ! -e /sbin/iptables ] || [ ! -e /sbin/ip6tables ]; then
	echo 'iptables debian package not installed'
	exit 1
fi

# Check if installed
if [ "${PREFIX}" = '' ]; then
	if [ -e /usr/local/etc/firewall ] || [ -e /usr/local/etc/firewall6 ] || [ -e /usr/local/sbin/firewall.sh ] || [ -e /usr/local/sbin/firewall6.sh ]; then
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
for i in firewall firewall6; do
	echo -n '[ln] etc/'"${i}"' /usr/local/etc'
		ln -s ${PACKAGE_DIR}/etc/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/etc/init.d
cd ${PREFIX}/usr/local/etc/init.d
echo -n '[ln] etc/init.d/firewall /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/firewall . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd ${PREFIX}/usr/local/sbin
for i in firewall.sh firewall6.sh; do
	echo -n '[ln] sbin/'"${i}"' /usr/local/sbin'
		ln -s ${PACKAGE_DIR}/sbin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc/init.d
cd ${PREFIX}/etc/init.d
echo -n '[ln] /usr/local/etc/init.d/firewall /etc/init.d'
	ln -s /usr/local/etc/init.d/firewall . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
#echo ' ! Configure /usr/local/etc/rc.local.d'
echo ' ! Insserv /etc/init.d/firewall'

echo ''
exit 0
