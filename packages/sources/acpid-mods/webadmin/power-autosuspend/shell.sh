#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, readlink, cat, grep, sed

# Settings
acpid_autosuspend_config='/usr/local/etc/acpid-autosuspend'

# Import PATH variable
. ./lib/shell/path.rc

# No links are allowed
acpid_autosuspend_config=$(readlink -f "${acpid_autosuspend_config}")

case $1 in
	'autosuspend')
		case $2 in
			'get-enabled')
				daemon_enabled=false
				. ${acpid_autosuspend_config}/config.rc

				if [ -e /tmp/.acpid-autosuspend-temporary_disabled ]; then
					echo -n "tempdisabled|${activate_at_hour}|${activate_at_min}|${deactivate_at_hour}|${deactivate_at_min}"
				else
					echo -n "${daemon_enabled}|${activate_at_hour}|${activate_at_min}|${deactivate_at_hour}|${deactivate_at_min}"
				fi
			;;
			'get-oneshot')
				. ${acpid_autosuspend_config}/config.rc
				if [ -e "${oneshot_file}" ]; then
					 . $oneshot_file
					echo -n "true|${activate_at_hour}|${activate_at_min}|${deactivate_at_hour}|${deactivate_at_min}"
				else
					echo -n "false|${activate_at_hour}|${activate_at_min}|${deactivate_at_hour}|${deactivate_at_min}"
				fi
			;;
			'set')
				case $3 in
					'activate')
						. ${acpid_autosuspend_config}/config.rc
						${daemon_enabled} || sed -i 's/daemon_enabled=false/daemon_enabled=true/g' ${acpid_autosuspend_config}/config.rc
						[ -e /tmp/.acpid-autosuspend-reload_settings ] || touch /tmp/.acpid-autosuspend-reload_settings
					;;
					'deactivate')
						. ${acpid_autosuspend_config}/config.rc
						${daemon_enabled} && sed -i 's/daemon_enabled=true/daemon_enabled=false/g' ${acpid_autosuspend_config}/config.rc
						[ -e /tmp/.acpid-autosuspend-reload_settings ] || touch /tmp/.acpid-autosuspend-reload_settings
					;;
					'time')
						. ${acpid_autosuspend_config}/config.rc
						[ "${activate_at_hour}" = "${4}" ] || sed -i 's/activate_at_hour='"${activate_at_hour}"'/activate_at_hour='"${4}"'/g' ${acpid_autosuspend_config}/config.rc
						[ "${activate_at_min}" = "${5}" ] || sed -i 's/activate_at_min='"${activate_at_min}"'/activate_at_min='"${5}"'/g' ${acpid_autosuspend_config}/config.rc
						[ "${deactivate_at_hour}" = "${6}" ] || sed -i 's/deactivate_at_hour='"${deactivate_at_hour}"'/deactivate_at_hour='"${6}"'/g' ${acpid_autosuspend_config}/config.rc
						[ "${deactivate_at_min}" = "${7}" ] || sed -i 's/deactivate_at_min='"${deactivate_at_min}"'/deactivate_at_min='"${7}"'/g' ${acpid_autosuspend_config}/config.rc
						[ -e /tmp/.acpid-autosuspend-reload_settings ] || touch /tmp/.acpid-autosuspend-reload_settings
					;;
					'oneshot-time')
						. ${acpid_autosuspend_config}/config.rc
						if [ "$4" = 'remove' ]; then
							rm ${oneshot_file}
						else
							echo 'activate_at_hour='"${4}" > ${oneshot_file}
							echo 'activate_at_min='"${5}" >> ${oneshot_file}
							echo 'deactivate_at_hour='"${6}" >> ${oneshot_file}
							echo 'deactivate_at_min='"${7}" >> ${oneshot_file}
						fi
					;;
				esac
			;;
			'lock')
				[ -e /tmp/.acpid-autosuspend-temporary_disabled ] || touch /tmp/.acpid-autosuspend-temporary_disabled
			;;
			'unlock')
				[ -e /tmp/.acpid-autosuspend-temporary_disabled ] && rm /tmp/.acpid-autosuspend-temporary_disabled
			;;
		esac
	;;
esac 

exit 0
