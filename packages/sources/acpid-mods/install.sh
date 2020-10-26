#!/bin/sh
# acpid-mods package
# install script
# This script has command line tweaks

# Debian dependencies: acpi-support-base

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='acpid-mods'

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
if [ -e ${PREFIX}/etc/acpi/pwrbutton.sh ]; then
	echo '/etc/acpi/powerbtn.sh exists, delete or rename this'
	exit 1
fi

# Check installed packages
if [ ! -e ${PREFIX}/etc/acpi ]; then
	echo 'acpi-support-base debian package not installed'
	exit 1
fi
#if [ ! -e ${PREFIX}/usr/local/etc/rc.local.d ]; then
#	echo 'rc.local package not installed'
#	exit 1
#fi

# Check if installed
if [ "${PREFIX}" = '' ]; then
	if [ -e /usr/local/etc/acpi ] || [ -e /usr/local/etc/acpid-suspend ] || [ -e /usr/local/etc/acpid-autosuspend ] || [ -e /usr/local/sbin/acpid-autosuspend.sh ] || [ -e /usr/local/sbin/acpid-choice.sh ] || [ -e /usr/local/sbin/acpid-suspend.sh ] || [ -e /usr/local/etc/init.d/acpid-autosuspend.sh ] || [ -e /etc/init.d/acpid-autosuspend.sh ]; then
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

# Install - rc.local package
#cd ${PREFIX}/usr/local/etc/rc.local.d
#echo -n '[ln] etc/rc.local.d/acpid-autosuspend.rc rc.local'
#	ln -s ${PACKAGE_DIR}/etc/rc.local.d/PKx_acpid-autosuspend.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd ${PREFIX}/usr/local/etc
for i in acpi acpid-autosuspend acpid-suspend acpid-choice.rc; do
	echo -n "[ln] etc/${i} /usr/local/etc"
		ln -s ${PACKAGE_DIR}/etc/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/sbin
cd ${PREFIX}/usr/local/sbin
echo -n '[ln] sbin/acpid-autosuspend.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/acpid-autosuspend.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] sbin/acpid-choice.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/acpid-choice.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] sbin/acpid-suspend.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/acpid-suspend.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/acpi
cd ${PREFIX}/etc/acpi
echo -n '[ln] /usr/local/etc/acpi/powerbtn.sh /etc/acpi'
	ln -s /usr/local/etc/acpi/powerbtn.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd ${PREFIX}/usr/local/etc/init.d
echo -n '[ln] etc/init.d/acpid-autosuspend.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/acpid-autosuspend.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd ${PREFIX}/etc/init.d
echo -n '[ln] /usr/local/etc/init.d/acpid-autosuspend.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/acpid-autosuspend.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
#echo ' ! Configure /usr/local/etc/rc.local.d'
echo ' ! Insserv /etc/init.d/acpid-autosuspend.sh'

echo ''
exit 0
