#!/bin/sh
# desktop-toolbox package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='desktop-toolbox'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local
for i in bin/apt-check bin/apt-updater etc/apt-updaterd.rc etc/desktop-toolbox/mod_apt-updater.rc etc/init.d/apt-updaterd sbin/apt-updaterd share/desktop-toolbox/mod_apt-updater.rc share/desktop-toolbox/mod_apt-updater.lang.d; do
	echo -n "/usr/local/${i}"
		if [ -L /usr/local/${i} ] && [ -e /usr/local/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /etc/init.d
echo -n '/etc/init.d/apt-updaterd'
	if [ -L /etc/init.d/apt-updaterd ] && [ -e /etc/init.d/apt-updaterd ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
