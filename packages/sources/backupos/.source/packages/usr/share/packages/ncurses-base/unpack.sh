#!/bin/sh
pwd="$(pwd)"

cd /
tar xf "${pwd}/ncurses-base.tar"
ln -s '/lib/terminfo' '/usr/share/terminfo' &

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm ${pwd}/ncurses-base* ${pwd}/*.txt "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
