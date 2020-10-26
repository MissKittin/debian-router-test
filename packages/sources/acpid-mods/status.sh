#!/bin/sh
# acpid-mods package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='acpid-mods'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/rc.local.d
#echo -n '/usr/local/etc/rc.local.d/acpid-autosuspend.rc'
#	if [ -L /usr/local/etc/rc.local.d/P*_acpid-autosuspend.rc ] && [ -e /usr/local/etc/rc.local.d/P*_acpid-autosuspend.rc ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

# /usr/local/etc
for i in acpi acpid-autosuspend acpid-suspend acpid-choice.rc; do
	echo -n "/usr/local/etc/${i}"
		if [ -L /usr/local/etc/${i} ] && [ -e /usr/local/etc/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /usr/local/sbin
for i in acpid-autosuspend.sh acpid-choice.sh acpid-suspend.sh; do
	echo -n "/usr/local/sbin/${i}"
		if [ -L /usr/local/sbin/${i} ] && [ -e /usr/local/sbin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /etc/acpi
echo -n '/etc/acpi/powerbtn.sh'
	if [ -L /etc/acpi/powerbtn.sh ] && [ -e /etc/acpi/powerbtn.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/acpid-autosuspend.sh'
	if [ -L /usr/local/etc/init.d/acpid-autosuspend.sh ] && [ -e /usr/local/etc/init.d/acpid-autosuspend.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/acpid-autosuspend.sh'
	if [ -L /etc/init.d/acpid-autosuspend.sh ] && [ -e /etc/init.d/acpid-autosuspend.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
