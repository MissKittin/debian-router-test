#!/bin/sh
# logs2ram package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='logs2ram'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/init.d
for i in logs2ram.sh zlogs2ram-sync.sh; do
	echo -n "/usr/local/etc/init.d/${i}"
		if [ -L /usr/local/etc/init.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /etc/init.d
for i in logs2ram.sh zlogs2ram-sync.sh; do
	echo -n "/etc/init.d/${i}"
		if [ -L /etc/init.d/${i} ] && [ -e /etc/init.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /etc/rcS.d
#echo -n '/etc/rcS.d/logs2ram.sh'
#	if [ -L /etc/rcS.d/*logs2ram.sh ] && [ -e /etc/rcS.d/*logs2ram.sh ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

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
