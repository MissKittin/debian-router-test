#!/bin/sh
# /tmp/.webadmin.stop must be root 644

# Settings
HOME='/usr/local/share/webadmin'
ADDR='0.0.0.0'
PORT='80'
ROUTER_SCRIPT="$HOME/router.php"
PHP_COMMAND='/usr/bin/php'
PHP_ARGS='-c /usr/local/etc/webadmin.php.ini'
LOG='/tmp/.webadmin.log'
PID='/tmp/.webadmin.pid'

# Functions & environment
#mountpoint -q /tmp || LOG='/dev/null' # no tmpfs - no log
log()
{
	echo "`date +%d.%m.%Y@%H:%M:%S` $@" >> $LOG 2>&1 || true
}
elog()
{
	log "E: $@"
	exit 1
}
[ -e $HOME ] || elog "$HOME not exist. Change it in $0"
[ -e $HOME/DISABLED.MAIN ] && elog "$HOME/DISABLED.MAIN exist. Aborting..."

# Command line
for i in $@; do
	case $i in
		log=*)
			LOG=${i#log=}/.webadmin.log
			PID=${i#log=}/.webadmin.pid
		;;
		'use_authbind')
			PHP_COMMAND='/usr/bin/authbind '"$PHP_COMMAND"
		;;
		append2log=*)
			log $(echo -n "${i#append2log=}" | sed -e 's/___/ /g')
			exit 0
		;;
		'print_logfile_location')
			echo -n $LOG
			exit 0
		;;
		'print_pidfile_location')
			echo -n $PID
			exit 0
		;;
	esac
done

log 'Starting PHP server...'
while true; do
	if [ -e $PID ] && [ ! -w $PID ]; then
		log "! $PID belongs to root, change owner to $(whoami), and then back to root"
		while [ ! -w $PID ]; do sleep 1; done
	fi

	env - $PHP_COMMAND $PHP_ARGS -S $ADDR:$PORT -t $HOME $ROUTER_SCRIPT >> $LOG 2>&1 &

	echo -n "$!" > $PID
	log "PHP server PID is $(cat $PID)"
	wait # for php kill

	sleep 1
	# Check /tmp/.webadmin.stop
	if [ -e /tmp/.webadmin.stop ]; then
		[ "$(stat -c %U /tmp/.webadmin.stop)" = 'root' ] && [ "$(stat -c %a /tmp/.webadmin.stop)" = '644' ] && break
	fi

	log "PHP server killed, restarting..."
done

log 'Server stopped by /tmp/.webadmin.stop'
rm /tmp/.webadmin.stop > /dev/null 2>&1 || log '/tmp/.webadmin.stop not removed, remove this manually'
exit 0
