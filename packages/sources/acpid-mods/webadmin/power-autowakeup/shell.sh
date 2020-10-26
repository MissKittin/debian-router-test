#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, cat, grep, sed

# Import PATH variable
. ./lib/shell/path.rc

case $1 in
	'autowakeup')
		acpid_suspend_sh_path='/usr/local/etc/acpid-suspend/config.rc'
		case $2 in
			'get-enabled')
				eval `cat $acpid_suspend_sh_path | grep wakeup_enabled='.'`
				$wakeup_enabled && echo -n 'checked="checked"'
			;;
			'get-time')
				eval `cat $acpid_suspend_sh_path | grep wakeup_at='.'`
				eval `cat $acpid_suspend_sh_path | grep wakeup_enabled='.'`
				if $wakeup_enabled; then
					[ "$3" = 'only-time' ] && echo -n "$wakeup_at" || echo -n "Router will wake up at $wakeup_at"
				else
					[ "$3" = 'only-time' ] && echo -n "$wakeup_at"
				fi
			;;
			'set-enabled')
				eval `cat $acpid_suspend_sh_path | grep wakeup_enabled='.'`
				[ "$3" = 'yes' ] && wakeup_setting='true' || wakeup_setting='false'
				[ "$wakeup_enabled" = "$wakeup_setting" ] && exit 0
				sed -i 's/wakeup_enabled='"'""$wakeup_enabled""'"'/wakeup_enabled='"'"$wakeup_setting"'"'/g' $acpid_suspend_sh_path
			;;
			'set-time')
				eval `cat $acpid_suspend_sh_path | grep wakeup_at='.'`
				[ "$wakeup_at" = "$3" ] && exit 0
				sed -i 's/wakeup_at='"'""$wakeup_at""'"'/wakeup_at='"'"$3"'"'/g' $acpid_suspend_sh_path
			;;
		esac
	;;
esac

exit 0
