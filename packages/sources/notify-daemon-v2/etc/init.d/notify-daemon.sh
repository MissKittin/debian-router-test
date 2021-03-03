#!/bin/sh
### BEGIN INIT INFO
# Provides:          notify-daemon
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Run Notify daemon
### END INIT INFO

# Options
PIDFILE='/var/run/notify-daemon.pid'
DAEMON='/usr/local/bin/notify-daemon.sh'
DAEMON_OPTS='--daemon'

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

case "$1" in
	'start')
		log_daemon_msg 'Starting daemon' 'notify-daemon'
		if ${0} status > /dev/null 2>&1; then
			log_end_msg 1
		else
			start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
			log_end_msg $?
		fi
	;;
	'stop')
		log_daemon_msg 'Stopping daemon' 'notify-daemon'
		if [ -e $PIDFILE ]; then
			start-stop-daemon --stop --quiet --pidfile $PIDFILE && rm $PIDFILE
			log_end_msg $?
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p $PIDFILE $DAEMON "notify-daemon" && exit 0 || exit $?
	;;
	*)
		echo 'notify-daemon.sh start|stop|status'
		exit 1
	;;
esac

exit 0
