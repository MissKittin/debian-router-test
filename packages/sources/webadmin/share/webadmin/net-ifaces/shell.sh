#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh  /bin/dash
#?php has_superuser_shebang
# Command stack: dash, ifconfig, ethtool

# Import PATH variable
. ./lib/shell/path.rc

case $1 in
	'interfaces-all')
		ifconfig -a
	;;
	'ethtool')
		for i in $(ls /sys/class/net); do
			ethtool $i 2>/dev/null
		done
	;;
esac

exit 0
