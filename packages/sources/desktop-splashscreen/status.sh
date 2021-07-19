#!/bin/sh
# desktop-splashscreen package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='desktop-splashscreen'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

for i in /usr/local/etc/desktop-splashscreen /usr/local/etc/init.d/aasplashscreen-boot /usr/local/etc/init.d/aasplashscreen-shutdown /usr/local/etc/init.d/zsplashscreen-stop /etc/init.d/aasplashscreen-boot /etc/init.d/aasplashscreen-shutdown /etc/init.d/zsplashscreen-stop; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

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
