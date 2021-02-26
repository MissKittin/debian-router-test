#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, cat, grep, sed

# Settings
acpid_autosuspend_config='/usr/local/etc/acpid-suspend'

# Import PATH variable
. ./lib/shell/path.rc

# No links are allowed
acpid_autosuspend_config=$(readlink -f "${acpid_autosuspend_config}")

case $1 in
	'autowakeup')
		#acpid_suspend_sh_path='/usr/local/etc/acpid-suspend/config.rc'
		case $2 in
			#'get-enabled')
			#	eval `cat $acpid_suspend_sh_path | grep wakeup_enabled='.'`
			#	$wakeup_enabled && echo -n 'checked="checked"'
			#;;
			#'get-time')
			#	eval `cat $acpid_suspend_sh_path | grep wakeup_at='.'`
			#	eval `cat $acpid_suspend_sh_path | grep wakeup_enabled='.'`
			#	if $wakeup_enabled; then
			#		[ "$3" = 'only-time' ] && echo -n "$wakeup_at" || echo -n "Router will wake up at $wakeup_at"
			#	else
			#		[ "$3" = 'only-time' ] && echo -n "$wakeup_at"
			#	fi
			#;;
			#'set-enabled')
			#	eval `cat $acpid_suspend_sh_path | grep wakeup_enabled='.'`
			#	[ "$3" = 'yes' ] && wakeup_setting='true' || wakeup_setting='false'
			#	[ "$wakeup_enabled" = "$wakeup_setting" ] && exit 0
			#	sed -i 's/wakeup_enabled='"'""$wakeup_enabled""'"'/wakeup_enabled='"'"$wakeup_setting"'"'/g' $acpid_suspend_sh_path
			#;;
			#'set-time')
			#	eval `cat $acpid_suspend_sh_path | grep wakeup_at='.'`
			#	[ "$wakeup_at" = "$3" ] && exit 0
			#	sed -i 's/wakeup_at='"'""$wakeup_at""'"'/wakeup_at='"'"$3"'"'/g' $acpid_suspend_sh_path
			#;;

			'get-time')
				config_first_import='true'
				. "${acpid_autosuspend_config}/config.rc"
				unset config_first_import

				echo -n "${wakeup_at}"
			;;
			'get-oneshot')
				config_first_import='true'
				. "${acpid_autosuspend_config}/config.rc"
				unset config_first_import

				if [ -e "${oneshot_file}" ]; then
					. "${oneshot_file}"
					echo -n "true|${wakeup_at}"
				else
					echo -n "false|${wakeup_at}"
				fi
			;;
			'set')
				case "${3}" in
					'time')
						config_first_import='true'
						. "${acpid_autosuspend_config}/config.rc"
						unset config_first_import

						[ "${wakeup_at}" = "${4}" ] || sed -i 's/wakeup_at='"'${wakeup_at}'"'/wakeup_at='"'${4}'"'/g' "${acpid_autosuspend_config}/config.rc"
					;;
					'oneshot-time')
						config_first_import='true'
						. "${acpid_autosuspend_config}/config.rc"
						unset config_first_import

						if [ "${4}" = 'remove' ]; then
							rm ${oneshot_file}
						else
							echo 'wakeup_at='"'${4}'" > "${oneshot_file}"
							chmod "${oneshot_file_mode}" "${oneshot_file}"
							chown "${oneshot_file_owner}:${oneshot_file_owner}" "${oneshot_file}"
						fi
					;;
				esac
			;;
		esac
	;;
esac

exit 0
