#!/bin/sh
# webadmin package
# uninstall script

# Settings
PACKAGE_NAME='webadmin' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
if [ ! -e /usr/local/sbin/webadmin.sh ] || [ ! -e /usr/local/share/webadmin ] || [ ! -e /usr/local/etc/rc.local.d/P*_webadmin.rc ] || [ ! -e /usr/local/etc/sudoers.d/webadmin ] || [ ! -e /etc/sudoers.d/webadmin ]; then
	echo 'Not installed'
	exit 1
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
echo -n '[rm] /usr/local/etc/rc.local.d/webadmin.rc'
	rm /usr/local/etc/rc.local.d/P*_webadmin.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/webadmin.sh'
	rm /usr/local/sbin/webadmin.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/webadmin'
	rm /usr/local/share/webadmin > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/authbind/byport
echo -n '[rm] /usr/local/etc/authbind/byport/80'
	rm /usr/local/etc/authbind/byport/80 > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/sudoers.d
echo -n '[rm] /usr/local/etc/sudoers.d/webadmin'
	rm /usr/local/etc/sudoers.d/webadmin > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/authbind/byport
echo -n '[rm] /etc/authbind/byport/80'
	rm /etc/authbind/byport/80 > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/sudoers.d/webadmin
echo -n '[rm] /etc/sudoers.d/webadmin'
	rm /etc/sudoers.d/webadmin > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'


echo ''
exit 0
