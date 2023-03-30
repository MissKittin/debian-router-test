#!/bin/sh

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

echo -n 'Group that can use su: '
read group

[ "${group}" = '' ] && exit 1

if ! grep "^${group}" /etc/group > /dev/null 2>&1; then
	echo 'That group does not exists'
	exit 1
fi

dpkg-statoverride --update --add root ${group} 4750 /bin/su

exit 0
