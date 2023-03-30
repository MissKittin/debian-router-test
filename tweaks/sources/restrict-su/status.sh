#!/bin/sh
installed=false
broken=false
echo ''

if dpkg-statoverride --list /bin/su > /dev/null 2>&1; then
	echo ' Tweak installed'
	exit 0
else
	echo ' Tweak not installed'
	exit 1
fi
