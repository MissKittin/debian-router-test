#!/bin/sh
#################### Check environment #####################
if [ ! "`whoami`" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
############################################################

[ -e "${DESTINATION}/../.bin" ] && PATH="${PATH}:${DESTINATION}/../.bin"
case $1 in
	'start')
		if lsmod | grep snd_dummy > /dev/null 2>&1; then
			echo 'Sound already loaded'
			exit 1
		fi
		if lsmod | grep soundcore > /dev/null 2>&1; then
			echo 'Another sound driver is already loaded'
			exit 1
		fi
		modprobe snd_dummy index=0
	;;
	'status')
		if lsmod | grep snd_dummy > /dev/null 2>&1; then
			echo 'Sound loaded'
			exit 0
		fi
		echo 'Sound not loaded'
		exit 1
	;;
	'stop')
		if ! lsmod | grep snd_dummy > /dev/null 2>&1; then
			echo 'Sound already not loaded'
			exit 1
		fi
		for i in snd_dummy snd_pcm snd_timer snd soundcore; do
			rmmod $i
		done
	;;
	*)
		echo 'start|status|stop'
	;;
esac

exit 0
