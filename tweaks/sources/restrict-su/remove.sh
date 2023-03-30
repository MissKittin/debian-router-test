#!/bin/sh

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

dpkg-statoverride --remove /bin/su
chown root:root /bin/su
chmod 4755 /bin/su

exit 0
