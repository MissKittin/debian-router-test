#!/bin/sh
pwd="$(pwd)"

mkdir '/etc/init.d' '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/syslogd" '/etc/init.d/syslogd'
mv "${pwd}/klogd" '/etc/init.d/klogd'
ln -s '../init.d/syslogd' '/etc/rc.d/S10syslogd' &
ln -s '../init.d/syslogd' '/etc/rc.d/K81syslogd' &
ln -s '../init.d/klogd' '/etc/rc.d/S11klogd' &
ln -s '../init.d/klogd' '/etc/rc.d/K80klogd' &

mkdir '/var/log' > '/dev/null' 2>&1
echo -n '' > '/var/log/messages'
chmod 640 '/var/log/messages' &

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
