#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/sbin' > '/dev/null' 2>&1
mv "${pwd}/hdparm" '/usr/sbin/hdparm'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm ${pwd}/*.txt "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
