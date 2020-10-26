#!/bin/sh
# debian-eol package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='debian-eol'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/bin
echo -n '/usr/local/bin/debian-eol.php'
	if [ -L /usr/local/bin/debian-eol.php ] && [ -e /usr/local/bin/debian-eol.php ]; then
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
