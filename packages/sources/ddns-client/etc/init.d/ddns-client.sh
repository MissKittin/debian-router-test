#!/bin/sh
### BEGIN INIT INFO
# Provides:          ddns-client
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Start ddns-client daemon
### END INIT INFO

# Options
PIDFILE='/var/run/ddns-client.pid'
DAEMON='/usr/local/bin/ddns-client.sh'
[ "${2}" = '' ] && LOG='/var/tmp/.ddns-client.log' || LOG="${2}"
DAEMON_OPTS="$LOG"

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

# Log owner
if [ ! -e "${LOG}" ]; then
	echo '' > "${LOG}"
	chown nobody:nogroup "${LOG}"
fi

case "$1" in
	'start')
		log_daemon_msg 'Starting ddns client' 'ddns-client'
		if ${0} status > /dev/null 2>&1; then
			log_end_msg 1
		else
			start-stop-daemon --start --chuid nobody:nogroup --quiet --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS && log_end_msg 0 || log_end_msg 1
		fi
	;;
	'stop')
		log_daemon_msg 'Stopping ddns client' 'ddns-client'
		if [ -e $PIDFILE ]; then
			start-stop-daemon --stop --quiet --pidfile $PIDFILE && rm $PIDFILE
			log_end_msg $?
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p $PIDFILE $DAEMON "ddns-client" && exit 0 || exit $?
	;;
	*)
		echo 'ddns-client.sh start|stop|status'
		exit 1
	;;
esac

exit 0
