#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/sbin' > '/dev/null' 2>&1
mv "${pwd}/xtables-multi" '/usr/sbin/xtables-multi'
for i in 'iptables' 'main4' 'iptables-save' 'save4' 'iptables-restore' 'restore4' 'iptables-xml' 'xml' 'ip6tables' 'main6' 'ip6tables-save' 'save6' 'ip6tables-restore' 'restore6'; do
	ln -s 'xtables-multi' "/usr/sbin/${i}" &
done

# load basic modules
for i in iptable_filter ip6table_filter xt_tcpudp crc32c xt_conntrack; do
	modprobe "${i}" > '/dev/null' 2>&1
done

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm ${pwd}/*.txt "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
