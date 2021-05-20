#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/bin' > '/dev/null' 2>&1
mv "${pwd}/bash-static" '/usr/bin/bash'
ln -s '/usr/bin/bash' '/bin/bash' &

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/source.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
