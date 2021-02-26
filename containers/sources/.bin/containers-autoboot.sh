#!/bin/sh
# Script for sysvinit to automatically boot containers when OS starts/shutdown
# first run: ./containers-autoboot.sh install
# then add containers-autoboot to the boot queue (rc2.d, rc0.d, rc6.d)
# you link it to the rc2.d init-parallel queue instead of linking to the /etc/rc2.d

### BEGIN INIT INFO
# Provides:             containers-autoboot
# Required-Start:
# Required-Stop:        rc.local rmnologin
# Default-Start:        2 3 4 5
# Default-Stop:         0 6
# Short-Description:    Start/stop containers on boot/shutdown
# Description:          Start/stop containers on boot/shutdown
### END INIT INFO

# Settings
start_in_background='true' # true -> parallel, false -> sequential
autoboot_file='.autoboot'
LOG='/var/run/.containers-autoboot.log'
[ -e '/var/log/containers-autoboot.log' ] && LOG='/var/log/containers-autoboot.log'
GZIP_LOG='true'

print_S1() { echo -n "${1}"; }
log()
{
	if [ ! -e "${LOG}" ]; then
		echo -n '' > "${LOG}"
		chmod 640 "${LOG}"
		chown root:adm "${LOG}"
	fi
	echo "[$(print_S1 $(cat '/proc/uptime'))] ($(date '+%Y-%m-%d %H:%M:%S')) ${@}" >> "${LOG}"
}
start_stop_containers()
{
	# ${1} -> start || stop

	local containers_path="$(readlink -f "$(dirname "$(readlink -f "${0}")")/..")"
	local container
	for container in ${containers_path}/*; do
		if [ "${container}" = "${containers_path}" ]; then
			log "containers_path=${containers_path} is invalid"
			log "or no containers created"
			break
		fi
		if [ -x "${container}/${autoboot_file}" ]; then
			[ "${1}" = 'start' ] && log "Starting container ${container##*/}" || log "Stopping container ${container##*/}"
			if "${start_in_background}"; then
				"${container}/${autoboot_file}" "${1}" > /dev/null 2>&1 &
			else
				"${container}/${autoboot_file}" "${1}" 2>&1 | while read output_line; do
					log " ${output_line}"
				done
			fi
		else
			[ -d "${container}" ] && log "Container ${container##*/} does not have an executable ${autoboot_file}"
		fi
	done
}
stop_containers()
{
	local containers_path="$(readlink -f "$(dirname "$(readlink -f "${0}")")/..")"
	local container
	for container in ${containers_path}/*; do
		if [ "${container}" = "${containers_path}" ]; then
			log "containers_path=${containers_path} is invalid"
			log "or no containers created"
			break
		fi
		if [ -x "${container}/stop.sh" ]; then
			log "Stopping container ${container##*/}"
			"${container}/stop.sh" 2>&1 | while read output_line; do
				log " ${output_line}"
			done
		else
			log "Container ${container##*/} is invalid"
		fi
	done
}

PATH='/sbin:/bin:/usr/sbin:/usr/bin'
. /lib/lsb/init-functions

case "${1}" in
	'background-start')
		start_stop_containers start
		if ${GZIP_LOG}; then
			[ -e "${LOG}.gz" ] && mv "${LOG}.gz" "${LOG}.$(date '+%Y-%m-%d_%H-%M-%S').gz"
			gzip -9 ${LOG}
		fi
	;;
	'start')
		log_action_msg_pre; echo 'Starting containers'
		${0} background-start > /dev/null 2>&1 &
	;;
	'stop')
		log_daemon_msg 'Stopping containers' 'autoboot'
		#start_stop_containers stop
		stop_containers stop
		log_end_msg 0
	;;
	'install')
		echo -n 'Installing containers autoboot script...'
		if ln -s "$(readlink -f "${0}")" "/etc/init.d/${0##*/}" > /dev/null 2>&1; then
			echo ' [ OK ]'
			echo ''; echo "Add ${0##*/} to the boot queue"
		else
			echo ' [FAIL]'
			exit 1
		fi
	;;
	'uninstall')
		echo -n 'Uninstalling containers autoboot script...'
		if rm "/etc/init.d/${0##*/}" > /dev/null 2>&1; then
			echo ' [ OK ]'
			echo ''; echo "Remove ${0##*/} from boot queue"
		else
			echo ' [FAIL]'
			exit 1
		fi
	;;
	*)
		echo 'containers-autoboot.sh start|stop|gzip|install|uninstall'
		exit 1
	;;
esac

exit 0
