#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/sbin' > '/dev/null' 2>&1
mv "${pwd}/cfdisk" '/usr/sbin/cfdisk'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/dependencies.txt" "${pwd}/source.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
