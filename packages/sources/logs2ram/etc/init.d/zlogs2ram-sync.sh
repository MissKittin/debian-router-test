### BEGIN INIT INFO
# Provides:             logs2ram-sync
# Required-Start:
# Required-Stop:        umountfs
# Should-Start:
# Default-Start:
# Default-Stop:         0 6
# Short-Description:    Keeps /var/log in RAM
# Description: Moves the contents of /var/log to RAM during boot
#              and keeps it there until shutdown/reboot, when it
#              copies the contents back to permanent storage.
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin

. /lib/lsb/init-functions

case "$1" in
	'start')
		log_action_msg_pre; echo 'Logs will be saved in RAM'
		mkdir /var/run/logs2ram
		mount --bind /var/log /var/run/logs2ram
		mount -t tmpfs -o nosuid,noexec,nodev,mode=0755 logs2ram /var/log
		cp -rfp /var/run/logs2ram -T /var/log
	;;
	'stop')
		log_action_msg_pre; echo 'Syncing logs'
		mount -o remount,rw /var/run/logs2ram
		cp -rfup /var/log -T /var/run/logs2ram
		cd /var/run/logs2ram; find | sed 1d | while read line; do
			line=$(echo $line | cut -c2-)
			if [ ! -e "/var/log${line}" ]; then
				rm -r -f "/var/run/logs2ram${line}" > /dev/null 2>&1
			fi
		done
		#umount /var/log
		#umount /var/run/logs2ram
		#rmdir /var/run/logs2ram
	;;
esac
exit 0
