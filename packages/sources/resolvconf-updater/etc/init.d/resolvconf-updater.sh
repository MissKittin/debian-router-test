#!/bin/sh
### BEGIN INIT INFO
# Provides:          resolvconf-updater
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Run resolvconf-updater.sh daemon
### END INIT INFO

# Options
PIDFILE='/var/run/resolvconf-updater.pid'
DAEMON='/usr/local/sbin/resolvconf-updater.sh'
DAEMON_OPTS=''

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

case "$1" in
	'start')
		log_daemon_msg 'Starting resolv.conf updater' 'resolvconf-updater.sh'
		start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
		log_end_msg $?
	;;
	'stop')
		log_daemon_msg 'Stopping resolv.conf updater' 'resolvconf-updater.sh'
		if [ -e $PIDFILE ]; then
			start-stop-daemon --stop --quiet --pidfile $PIDFILE && rm $PIDFILE
			log_end_msg $?
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p $PIDFILE $DAEMON "resolvconf-updater.sh" && exit 0 || exit $?
	;;
	*)
		echo 'resolvconf-updater.sh start|stop|status'
		exit 1
	;;
esac

exit 0
