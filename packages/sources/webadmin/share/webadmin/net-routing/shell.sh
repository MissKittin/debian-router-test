#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, cat
# Optional command stack: netstat, ipset

# Import PATH variable
. ./lib/shell/path.rc

# Import routing listing library
. ./lib/shell/net-routing-list.rc

# Import iptables settings listing library
#. ./lib/shell/list-iptables-settings.rc

case $1 in
	'net-routing-list')
		case $2 in
			'netstat')
				command -v netstat > /dev/null 2>&1 && netstat -tulpn || echo '<span class="content_warning">Not installed!</span>'
			;;
			'ipset')
				command -v ipset > /dev/null 2>&1 && ipset --list || echo '<span class="content_warning">Not installed!</span>'
			;;
		esac
	;;
esac

exit 0
