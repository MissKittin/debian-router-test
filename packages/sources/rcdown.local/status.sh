#!/bin/sh
# rcdown.local package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='rcdown.local'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/
for i in rcdown.local rcdown.local.d; do
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
echo -n '/usr/local/etc/init.d/arcdown.local'
	if [ -L /usr/local/etc/init.d/arcdown.local ] && [ -e /usr/local/etc/init.d/arcdown.local ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/arcdown.local'
	if [ -L /etc/init.d/arcdown.local ] && [ -e /etc/init.d/arcdown.local ]; then
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
