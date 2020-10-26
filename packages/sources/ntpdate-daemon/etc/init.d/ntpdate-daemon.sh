#!/bin/sh
### BEGIN INIT INFO
# Provides:          ntpdate-daemon
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Cyclic time synchronization
### END INIT INFO

# Options
PIDFILE='/var/run/ntpdate-daemon.pid'
DAEMON='/usr/local/sbin/ntpdate-daemon.sh'
DAEMON_OPTS='--daemon'

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

case "$1" in
	'start')
		log_daemon_msg 'Starting time synchronization' 'ntpdate-daemon'
		start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
		log_end_msg $?
	;;
	'stop')
		log_daemon_msg 'Stopping time synchronization' 'ntpdate-daemon'
		if [ -e $PIDFILE ]; then
			start-stop-daemon --stop --quiet --pidfile $PIDFILE && rm $PIDFILE
			log_end_msg $?
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p $PIDFILE $DAEMON 'ntpdate-daemon' && exit 0 || exit $?
	;;
	'oneshot')
		${DAEMON} --oneshot
	;;
	*)
		echo 'ntpdate-daemon.sh start|stop|status|oneshot'
		exit 1
	;;
esac

exit 0
