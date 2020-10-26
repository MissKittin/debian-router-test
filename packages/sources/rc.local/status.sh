#!/bin/sh
# rc.local package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='rc.local'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
for i in rc.local rc.local.d; do
	echo -n "/usr/local/etc/${i}"
		if [ -L /usr/local/etc/${i} ] && [ -e /usr/local/etc/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/rc.local'
	if [ -L /usr/local/etc/init.d/rc.local ] && [ -e /usr/local/etc/init.d/rc.local ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc
echo -n '/etc/rc.local'
	if [ -L /etc/rc.local ] && [ -e /etc/rc.local ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi
echo -n '/etc/rc.local.old'
	if [ -e /etc/rc.local.old ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/rc.local'
	if [ -L /etc/init.d/rc.local ] && [ -e /etc/init.d/rc.local ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi
echo -n '/etc/init.d/rc.local.old'
	if [ -e /etc/init.d/rc.local.old ]; then
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
