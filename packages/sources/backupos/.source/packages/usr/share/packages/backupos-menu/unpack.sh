#!/bin/sh
pwd="$(pwd)"

cd /
tar xf "${pwd}/backupos-menu.tar"
[ ! -e '/var/run/.debug_noroofsclean' ] && rm ${pwd}/backupos-menu* > '/dev/null' 2>&1 &

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/unpack.sh" ${pwd}/*.txt
	rmdir "${pwd}"
fi

exit 0
