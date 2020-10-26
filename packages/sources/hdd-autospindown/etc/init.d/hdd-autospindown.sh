#!/bin/sh
### BEGIN INIT INFO
# Provides:          hdd-autospindown
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Setup HDD autospindown
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

LOG='/dev/null'
[ -e '/var/log/hdd-autospindown.log' ] && LOG='/var/log/hdd-autospindown.log'

case "${1}" in
	'start')
		log_action_msg_pre; echo 'Setting up HDD autospindown'
		/usr/local/sbin/hdd-autospindown.sh >> ${LOG} 2>&1 &
	;;
	*)
		echo 'hdd-autospindown.sh start'
	;;
esac

exit 0
