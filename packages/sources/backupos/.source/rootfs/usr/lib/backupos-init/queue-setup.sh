#!/bin/sh

if [ "${1}" = '-h' ] || [ "${1}" = '--help' ]; then
	echo "${0} [--rootfs-only]"
	exit 0
fi

cd "$(dirname "$(readlink -f "${0}")")/../../../etc"
[ ! -e './init' ] && mkdir './init'
cd './init'

if [ "${1}" = '--rootfs-only' ]; then
	QUEUE_S='
		console_splash
		init-functions
		path_temps
		init-log
		mount-base
		mdev
		urandom
		cmdline
		modprobe
		modules-load
		mdev
		hostname
		hosts
		security
		network-simple
	'
	QUEUE_K_A='
		disable-shutdown-signals
		console
		init-functions
		init-log
	'
	QUEUE_K_B='
		sendsigs
		mount-all
		swap
	'
else
	QUEUE_S='
		console_splash
		init-functions
		path_temps
		init-log
		mount-base
		mdev
		urandom
		cmdline
		modprobe
		modules-load
		mdev
		emergency-console
		checkroot-checkfs
		mount-all
		swap
		hostname
		hosts
		security
		network
	'
	QUEUE_K_A='
		disable-shutdown-signals
		console
		init-functions
		init-log
	'
	QUEUE_K_B='
		urandom
		network
		sendsigs
		mount-all
		swap
	'
fi
QUEUE_S_OPT()
{
	ln -s '../../lib/init/init/S_sysv.rc' './S555_sysv.rc'
	ln -s '../../lib/init/init/S_rclocal.rc' './S980_rclocal.rc'
	ln -s '../../lib/init/init/S_shutdown-signals.rc' './S990_shutdown-signals.rc'
	ln -s '../../lib/init/init/S_init-console.rc' './S999_init-console.rc'
}
QUEUE_K_OPT()
{
	ln -s '../../lib/init/init/K_sysv.rc' './K555_sysv.rc'
	ln -s '../../lib/init/init/K_poweroff.rc' './K999_poweroff.rc'
}

i_ind='0'
for i in ${QUEUE_S}; do
	case "${#i_ind}" in
		'1') prefix='00'; ;;
		'2') prefix='0'; ;;
		*) unset prefix; ;;
	esac
	ln -s "../../lib/init/init/S_${i}.rc" "./S${prefix}${i_ind}_${i}.rc"
	i_ind="$((i_ind+4))"
done
QUEUE_S_OPT

i_ind='0'
for i in ${QUEUE_K_A}; do
	case "${#i_ind}" in
		'1') prefix='00'; ;;
		'2') prefix='0'; ;;
		*) unset prefix; ;;
	esac
	ln -s "../../lib/init/init/K_${i}.rc" "./K${prefix}${i_ind}_${i}.rc"
	i_ind="$((i_ind+4))"
done
i_ind='800'
for i in ${QUEUE_K_B}; do
	ln -s "../../lib/init/init/K_${i}.rc" "./K${i_ind}_${i}.rc"
	i_ind="$((i_ind+4))"
done
QUEUE_K_OPT

exit 0
