#!/bin/sh
pwd="$(pwd)"

mkdir '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/firewall" '/etc/rc.d/S10firewall'

if [ -e '/etc/firewall.rc' ]; then
	mv '/etc/firewall.rc' '/etc/firewall.rc.bak'
	mv "${pwd}/firewall.rc" '/etc/firewall.rc'
	cat '/etc/firewall.rc.bak' >> '/etc/firewall.rc'
	rm '/etc/firewall.rc.bak'
else
	mv "${pwd}/firewall.rc" '/etc/firewall.rc'
fi

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/unpack.sh" ${pwd}/*.txt
	rmdir "${pwd}"
fi

exit 0
