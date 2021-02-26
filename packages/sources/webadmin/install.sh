#!/bin/sh
# webadmin package
# install script

# Debian dependencies: authbind sudo
# Debian recommended: php-cli

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='webadmin'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e /usr/bin/php ]; then
	echo ' ! php-cli debian package not installed'
	sleep 1
fi
if [ ! -e /usr/bin/authbind ]; then
	echo ' ! authbind debian package not installed'
	exit 1
fi
if [ ! -e /usr/bin/sudo ]; then
	echo ' ! sudo debian package not installed'
	exit 1
fi
#if [ ! -e /usr/local/etc/rc.local.d ]; then
#	echo 'rc.local package not installed'
#	exit 1
#fi

# Check environment
if [ ! -e /usr/local/etc/authbind/byport ]; then
	echo '/etc/authbind/byport not exists'
	echo 'Create this directory manually'
	exit 1
fi
if [ ! -e /usr/local/etc/sudoers.d ]; then
	echo '/usr/local/etc/sudoers.d not exists'
	echo 'Create this directory manually'
	exit 1
fi
if [ -e /etc/authbind/byport/80 ]; then
	echo '/etc/authbind/byport/80 exists'
	exit 1
fi
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ ! -e /usr/local/etc/default ]; then
	echo '/usr/local/etc/default not exists'
	echo 'Create this dir manually'
	exit 1
fi


# Check if installed
if [ -e /etc/init.d/webadmin ] || [ -e /usr/local/etc/default/webadmin ] || [ -e /usr/local/etc/init.d/webadmin ] || [ -e /usr/local/etc/webadmin.php.ini ] || [ -e /usr/local/share/webadmin ] || [ -e /etc/sudoers.d/webadmin ]; then
	echo 'Already installed'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/webadmin.php.ini /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/webadmin.php.ini . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - rc.local package
#cd /usr/local/etc/rc.local.d
#echo -n '[ln] etc/rc.local.d/webadmin.rc rc.local'
#	ln -s ${PACKAGE_DIR}/etc/rc.local.d/PKx_webadmin.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/default
cd /usr/local/etc/default
echo -n '[ln] etc/default/webadmin /usr/local/etc/default'
	ln -s ${PACKAGE_DIR}/etc/default/webadmin . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/webadmin /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/webadmin . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/authbind/byport
cd /usr/local/etc/authbind/byport
echo -n '[ln] etc/authbind/byport/80 /usr/local/etc/authbind/byport'
	ln -s ${PACKAGE_DIR}/etc/authbind/byport/80 . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/sudoers.d
cd /usr/local/etc/sudoers.d
echo -n '[ln] etc/sudoers.d/webadmin /usr/local/etc/sudoers.d'
	ln -s ${PACKAGE_DIR}/etc/sudoers.d/webadmin . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/authbind/byport
cd /etc/authbind/byport
echo -n '[ln] /usr/local/etc/authbind/byport/80 /etc/authbind/byport'
	ln -s /usr/local/etc/authbind/byport/80 . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d/webadmin
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/webadmin /etc/init.d'
	ln -s /usr/local/etc/init.d/webadmin . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/sudoers.d/webadmin
cd /etc/sudoers.d
echo -n '[ln] /usr/local/etc/sudoers.d/webadmin /etc/sudoers.d'
	ln -s /usr/local/etc/sudoers.d/webadmin . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
#cd /usr/local/sbin
#echo -n '[ln] sbin/webadmin.sh /usr/local/sbin'
#	ln -s ${PACKAGE_DIR}/sbin/webadmin.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/webadmin /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/webadmin . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Configure
php /usr/local/share/webadmin/lib/console/generate-cache.php

# Notification
echo ''
#echo ' ! Configure /usr/local/etc/rc.local.d'
echo ' ! Configure user in /etc/sudoers.d/webadmin'
echo ' ! chown user /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}/etc/authbind/byport/80'
echo ' ! Configure user in /usr/local/default/webadmin'
#echo ' ! Configure user in /usr/local/etc/rc.local.d/P*_webadmin.rc'
echo ' ! Insserv /etc/init.d/webadmin'
echo ' ! run `php /usr/local/share/webadmin/lib/console/passwdhash.php` and edit /usr/local/share/webadmin/lib/login/login-config.php'

echo ''
exit 0
