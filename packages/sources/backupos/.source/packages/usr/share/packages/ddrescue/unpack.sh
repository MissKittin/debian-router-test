#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/bin' > '/dev/null' 2>&1
mv "${pwd}/ddrescue" '/usr/bin/ddrescue'
mv "${pwd}/ddrescuelog" '/usr/bin/ddrescuelog'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm ${pwd}/*.txt "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
