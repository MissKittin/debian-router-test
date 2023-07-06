#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, notify-daemon.sh

# Import PATH variable
. ./lib/shell/path.rc

case $1 in
	'get-notifications')
		notify-daemon.sh --journal --list www
	;;
	'remove-notify')
		notify-daemon.sh --journal --del "${2}"
	;;
	'clear-notifications')
		notify-daemon.sh --journal --del --all
	;;
esac

exit 0