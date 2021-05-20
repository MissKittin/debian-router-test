#!/bin/sh
pwd="$(pwd)"

mkdir '/etc/init.d' '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/runit" '/etc/init.d/runit'
ln -s '../init.d/runit' '/etc/rc.d/S50runit' &
ln -s '../init.d/runit' '/etc/rc.d/K50runit' &

mkdir '/var/service' > '/dev/null' 2>&1

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
