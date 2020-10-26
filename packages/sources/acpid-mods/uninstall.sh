#!/bin/sh
# acpid-mods package
# uninstall script
# This script has command line tweaks

# Settings
PACKAGE_NAME='acpid-mods' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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

# Check environment
if [ ! -e /etc/acpi/powerbtn.sh ]; then
	echo '/etc/acpi/powerbtn.sh not exists'
	exit 1
fi

# Check if installed
if [ "${PREFIX}" = '' ]; then
	if [ ! -e /usr/local/etc/acpi ] || [ ! -e /usr/local/etc/acpid-suspend ] || [ ! -e /usr/local/etc/acpid-autosuspend ] || [ ! -e /usr/local/sbin/acpid-autosuspend.sh ] || [ ! -e /usr/local/sbin/acpid-choice.sh ] || [ ! -e /usr/local/sbin/acpid-suspend.sh ] || [ ! -e /usr/local/etc/init.d/acpid-autosuspend.sh ] || [ ! -e /etc/init.d/acpid-autosuspend.sh ]; then
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

# Uninstall - /usr/local/etc/rc.local.d
#echo -n '[rm] /usr/local/etc/rc.local.d/acpid-autosuspend.rc'
#	rm ${PREFIX}/usr/local/etc/rc.local.d/P*_acpid-autosuspend.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
for i in acpi acpid-autosuspend acpid-suspend acpid-choice.rc; do
	echo -n "[rm] /usr/local/etc/${i}"
		rm ${PREFIX}/usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/acpid-autosuspend.sh'
	rm ${PREFIX}/usr/local/sbin/acpid-autosuspend.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rm] /usr/local/sbin/acpid-choice.sh'
	rm ${PREFIX}/usr/local/sbin/acpid-choice.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rm] /usr/local/sbin/acpid-suspend.sh'
	rm ${PREFIX}/usr/local/sbin/acpid-suspend.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/acpi
echo -n '[rm] /etc/acpi/powerbtn.sh'
	rm ${PREFIX}/etc/acpi/powerbtn.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/acpid-autosuspend.sh'
	rm ${PREFIX}/usr/local/etc/init.d/acpid-autosuspend.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/acpid-autosuspend.sh'
	rm ${PREFIX}/etc/init.d/acpid-autosuspend.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/acpid-autosuspend.sh from /etc/rc*.d'

echo ''
exit 0
