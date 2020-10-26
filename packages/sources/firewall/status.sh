#!/bin/sh
# firewall package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='firewall'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/firewall'
	if [ -L /usr/local/etc/init.d/firewall ] && [ -e /usr/local/etc/init.d/firewall ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc
for i in firewall firewall6; do
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
for i in firewall.sh firewall6.sh; do
	echo -n "/usr/local/sbin/${i}"
		if [ -L /usr/local/sbin/${i} ] && [ -e /usr/local/sbin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /etc/init.d
echo -n '/etc/init.d/firewall'
	if [ -L /etc/init.d/firewall ] && [ -e /etc/init.d/firewall ]; then
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
