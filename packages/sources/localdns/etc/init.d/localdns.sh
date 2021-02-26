#!/bin/sh
### BEGIN INIT INFO
# Provides:          localdns
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Create hosts file for DNS server
### END INIT INFO

PATH='/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin'
. /lib/lsb/init-functions

case "${1}" in
	'start')
		log_action_msg_pre; echo 'Setting up localdns'
		localdns.sh > /dev/null 2>&1 &
	;;
esac

exit 0
