#!/bin/sh
# apt-cache package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='apt-cache'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

echo -n '/usr/local/bin/apt-check'
	if [ -L /usr/local/bin/apt-check ] && [ -e /usr/local/bin/apt-check ]; then
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
