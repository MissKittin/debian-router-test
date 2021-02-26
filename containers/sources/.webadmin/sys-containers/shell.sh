#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, dirname, readlink

case $1 in
	'containers')
		case $2 in
			'stats') exec $(dirname $(readlink -f $0))/../../.bin/stats.sh ;;
			'overlay_packages') exec $(dirname $(readlink -f $0))/../../.bin/check-overlay-pkgs.sh nocheck ;;
			'overlay_packages_check') exec $(dirname $(readlink -f $0))/../../.bin/check-overlay-pkgs.sh ;;
		esac
	;;
esac

exit 0
