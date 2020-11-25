#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, nohup, acpid-suspend.sh, halt, reboot

# Import PATH variable
. ./lib/shell/path.rc

case $1 in
	'suspend')
		nohup acpid-suspend.sh > /dev/null 2>&1 &
	;;
	'halt')
		halt
	;;
	'reboot')
		reboot
	;;
esac

exit 0
