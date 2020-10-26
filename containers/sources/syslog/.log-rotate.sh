#!/bin/sh
### BEGIN INIT INFO
# Provides:          log-rotate
# Required-Start:
# Required-Stop:
# Default-Start:
# Default-Stop:
# Short-Description: Rotate logs
### END INIT INFO

# Options
PIDFILE='/var/run/log-rotate.pid'
DAEMON="${0}"
DAEMON_OPTS='daemon'
LOG='/var/log/log-rotate.log'
LOG_DATE_FORMAT='%Y-%m-%d %H:%M:%S'

# Daemon options
DATE_FORMAT='%Y-%m-%d'
WAIT_SECONDS='604800'
MOVE_LOGS_TO='' # empty/comment to disable
LOGS_TO_ROTATE='
	/var/log/syslog.log
	/var/log/syslog_auth.log
	/var/log/syslog_daemon.log
	/var/log/syslog_debug.log
	/var/log/syslog_iptables.log
	/var/log/syslog_messages.log
'

if [ "${1}" = 'daemon' ]; then
	echo "$(date "+${LOG_DATE_FORMAT}") log-rotate.sh started" >> ${LOG}
	while true; do
		echo "$(date "+${LOG_DATE_FORMAT}") waiting ${WAIT_SECONDS} seconds" >> ${LOG}
		sleep "${WAIT_SECONDS}"
		for log in ${LOGS_TO_ROTATE}; do
			if [ -e "${log}" ]; then
				if [ -s "${log}" ]; then
					today="$(date "+${DATE_FORMAT}")"

					echo "$(date "+${LOG_DATE_FORMAT}") rotating log ${log}" >> ${LOG}
					#mv "${log}" "${log}.${today}" >> ${LOG} 2>&1
					cp -p "${log}" "${log}.${today}" >> ${LOG} 2>&1

					echo "$(date "+${LOG_DATE_FORMAT}") clearing log ${log}" >> ${LOG}
					echo -n '' > ${log}

					echo "$(date "+${LOG_DATE_FORMAT}") compressing log ${log}" >> ${LOG}
					gzip -9 "${log}.${today}" >> ${LOG} 2>&1

					if [ ! "${MOVE_LOGS_TO}" = '' ]; then
						echo "$(date "+${LOG_DATE_FORMAT}") moving ${log} to ${MOVE_LOGS_TO}"
						mv "${log}.${today}.gz" "${MOVE_LOGS_TO}" >> ${LOG} 2>&1
					fi

					unset today
				else
					echo "$(date "+${LOG_DATE_FORMAT}") ${log} is empty - not rotating" >> ${LOG}
				fi
			else
				echo "$(date "+${LOG_DATE_FORMAT}") ${log} not exists - not rotating" >> ${LOG}
			fi
		done
		unset log
	done
	exit 0
fi

PATH=/sbin:/bin:/usr/sbin:/usr/bin
. /lib/lsb/init-functions

case "${1}" in
	'start')
		log_daemon_msg 'Starting log rotation' 'log-rotate'
		start-stop-daemon --start --quiet --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} -- ${DAEMON_OPTS}
		log_end_msg ${?}
	;;
	'stop')
		log_daemon_msg 'Stopping log rotation' 'log-rotate'
		if [ -e "${PIDFILE}" ]; then
			start-stop-daemon --stop --quiet --pidfile ${PIDFILE} && rm ${PIDFILE}
			log_end_msg ${?}
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p ${PIDFILE} ${DAEMON} 'log-rotate' && exit 0 || exit ${?}
	;;
	*)
		echo 'log-rotate.sh start|stop|status'
		exit 1
	;;
esac

exit 0
