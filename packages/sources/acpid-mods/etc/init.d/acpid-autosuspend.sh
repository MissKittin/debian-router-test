#!/bin/sh
### BEGIN INIT INFO
# Provides:          acpid-autosuspend
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Run autosuspend daemon
### END INIT INFO

# Options
PIDFILE='/var/run/acpid-autosuspend.pid'
DAEMON='/usr/local/sbin/acpid-autosuspend.sh'
LOG='/var/run/acpid-autosuspend.log'
[ -e '/var/log/acpid-autosuspend.log' ] && LOG='/var/log/acpid-autosuspend.log'
[ "${2}" = '' ] || LOG="${2}"
DAEMON_OPTS="${LOG}"

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

case "$1" in
	'start')
		log_daemon_msg 'Starting autosuspend daemon' 'acpid-autosuspend'
		if ${0} status > /dev/null 2>&1; then
			log_end_msg 1
			exit 1
		fi
		if start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS; then
			if [ ! -e $LOG ]; then
				touch ${LOG}
				chown root:adm $LOG
				chmod 640 $LOG
			fi
			log_end_msg 0
		else
			log_end_msg 1
		fi
	;;
	'stop')
		log_daemon_msg 'Stopping autosuspend daemon' 'acpid-autosuspend'
		if [ -e $PIDFILE ]; then
			start-stop-daemon --stop --quiet --pidfile $PIDFILE && rm $PIDFILE
			log_end_msg $?
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p $PIDFILE $DAEMON 'acpid-autosuspend' && exit 0 || exit $?
	;;
	*)
		echo 'acpid-autosuspend.sh start|stop|status'
		exit 1
	;;
esac

exit 0
