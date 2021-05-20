#!/bin/sh
pwd="$(pwd)"

mkdir '/etc/init.d' '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/crond" '/etc/init.d/crond'
#ln -s '../init.d/crond' '/etc/rc.d/S50crond' &
#ln -s '../init.d/crond' '/etc/rc.d/K50crond' &

mkdir -p '/var/spool/cron/crontabs' > '/dev/null' 2>&1
echo -n '' >> '/var/spool/cron/crontabs/root'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
