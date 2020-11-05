#!/bin/sh
### BEGIN INIT INFO
# Provides:          pxe-nas-urandom
# Required-Start:
# Required-Stop:     urandom
# Default-Start:
# Default-Stop:      0 6
# Short-Description: Save and restore random seed between restarts.
# Description:       This script saves the random seed between restarts.
#                    It is called from the boot, halt and reboot scripts.
### END INIT INFO

PATH=/sbin:/bin
SAVEDFILE=/var/lib/urandom/random-seed
INDICATOR=/run/pxe-nas/.autoconfig-urandom

. /lib/lsb/init-functions

[ -e ${INDICATOR} ] || exit 0

case $1 in
	'start')
		if [ -e "$(cat ${INDICATOR})/uradom-seed" ]; then
			log_action_msg_pre; echo 'Restoring urandom seed...'
			cat "$(cat ${INDICATOR})/uradom-seed" > $SAVEDFILE
			/etc/init.d/urandom start
			rm $SAVEDFILE
		fi
	;;
	'stop')
		log_action_msg_pre; echo 'Saving urandom seed...'
		/etc/init.d/urandom stop
		cat $SAVEDFILE > "$(cat ${INDICATOR})/uradom-seed"
	;;
esac

exit 0
