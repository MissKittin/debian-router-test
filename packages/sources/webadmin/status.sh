#!/bin/sh
# webadmin package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='webadmin'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/webadmin.php.ini'
	if [ -L /usr/local/etc/webadmin.php.ini ] && [ -e /usr/local/etc/webadmin.php.ini ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/rc.local.d
#echo -n '/usr/local/etc/rc.local.d/webadmin.rc'
#	if [ -L /usr/local/etc/rc.local.d/P*_webadmin.rc ] && [ -e /usr/local/etc/rc.local.d/P*_webadmin.rc ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

# /usr/local/etc/default
echo -n '/usr/local/etc/default/webadmin'
	if [ -L /usr/local/etc/default/webadmin ] && [ -e /usr/local/etc/default/webadmin ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/webadmin'
	if [ -L /usr/local/etc/init.d/webadmin ] && [ -e /usr/local/etc/init.d/webadmin ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/authbind/byport
echo -n '/usr/local/etc/authbind/byport/80'
	if [ -L /usr/local/etc/authbind/byport/80 ] && [ -e /usr/local/etc/authbind/byport/80 ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/sudoers.d
echo -n '/usr/local/etc/sudoers.d/zwebadmin'
	if [ -L /usr/local/etc/sudoers.d/zwebadmin ] && [ -e /usr/local/etc/sudoers.d/zwebadmin ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/authbind/byport
echo -n '/etc/authbind/byport/80'
	if [ -L /etc/authbind/byport/80 ] && [ -e /etc/authbind/byport/80 ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/webadmin'
	if [ -L /etc/init.d/webadmin ] && [ -e /etc/init.d/webadmin ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/sudoers.d
echo -n '/etc/sudoers.d/zwebadmin'
	if [ -L /etc/sudoers.d/zwebadmin ] && [ -e /etc/sudoers.d/zwebadmin ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
#echo -n '/usr/local/sbin/webadmin.sh'
#	if [ -L /usr/local/sbin/webadmin.sh ] && [ -e /usr/local/sbin/webadmin.sh ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

# /usr/local/share
echo -n '/usr/local/share/webadmin'
	if [ -L /usr/local/share/webadmin ] && [ -e /usr/local/share/webadmin ]; then
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
