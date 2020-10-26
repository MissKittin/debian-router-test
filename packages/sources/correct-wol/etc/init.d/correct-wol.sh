#!/bin/sh
### BEGIN INIT INFO
# Provides:          correct-wol
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Correct WOL parameters
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

case "${1}" in
	'start')
		log_action_msg_pre; echo 'Correcting WOL parameters'
		/usr/local/sbin/correct-wol.sh > /dev/null 2>&1 &
	;;
	*)
		echo 'correct-wol.sh start'
	;;
esac

exit 0
