#!/bin/sh
if [ ! -e /sbin/telnetd-login ]; then
	pwd=$(pwd)
	cd /
	ln -s ${pwd}/telnetd-login /sbin/telnetd-login
	rm ${pwd}/*.txt
	unset pwd
fi

/bin/telnetd -l /sbin/telnetd-login
exit 0
