#!/bin/sh
### BEGIN INIT INFO
# Provides:          fancontrol-weather
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Run or stop fancontrol automatically
### END INIT INFO

# Options
PIDFILE='/var/run/fancontrol-weather.pid'
DAEMON='/usr/local/sbin/fancontrol-weather.sh'
LOG='/var/run/.fancontrol-weather.log'
[ ! "${2}" = '' ] && LOG="${2}"
DAEMON_OPTS="$LOG"

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

if [ ! -e /etc/init.d/fancontrol ]; then
	log_daemon_msg 'fancontrol not installed - not starting' 'fancontrol-weather'
	log_end_msg 1
	exit 1
fi

case "$1" in
	'start')
		log_daemon_msg 'Starting fancontrol automation' 'fancontrol-weather'
		start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS && log_end_msg 0 || log_end_msg 1
	;;
	'stop')
		log_daemon_msg 'Stopping fancontrol automation' 'fancontrol-weather'
		if [ -e $PIDFILE ]; then
			daemon_pid=$(cat ${PIDFILE})
			start-stop-daemon --stop --quiet --pidfile $PIDFILE && rm $PIDFILE && \
			kill $(ps -o pid= --ppid ${daemon_pid}) > /dev/null 2>&1
			log_end_msg $?
		else
			log_end_msg 1
		fi
	;;
	'status')
		status_of_proc -p $PIDFILE $DAEMON "fancontrol-weather" && exit 0 || exit $?
	;;
	*)
		echo 'fancontrol-weather.sh start|stop|status'
		exit 1
	;;
esac

exit 0
