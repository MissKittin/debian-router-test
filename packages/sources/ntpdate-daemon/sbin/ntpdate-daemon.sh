#!/bin/sh

install_dir='/usr/local'
. ${install_dir}/etc/ntpdate-daemon.rc

do_ntpdate()
{
	if [ ! "${ping_host}" = 'false' ]; then
		echo " :: Checking internet connection - pinging ${ping_host} ..."
		while ! wget -q --tries=10 --timeout=20 --spider ${ping_host}; do
			echo '     No internet'
			sleep 10
		done
	fi
	echo ' :: Synchronizing...'
	${ntpdate_command}
}

case ${1} in
	'--daemon')
		while true; do
			do_ntpdate > /dev/null 2>&1
			sleep ${sync_every}
		done
	;;
	'--oneshot')
		do_ntpdate
	;;
	*)
		echo ''
		echo ' Usage:'
		echo ' ntpdate-daemon.sh --daemon'
		echo ' ntpdate-daemon.sh --oneshot'
		echo ''
	;;
esac

exit 0
