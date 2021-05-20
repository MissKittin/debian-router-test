#!/bin/sh
pwd="$(pwd)"

addgroup -S 'telnetd' > '/dev/null' 2>&1
adduser -g '' -S -G 'telnetd' -H -h '/run/.telnetd' 'telnetd' > '/dev/null' 2>&1 &

mkdir '/etc/init.d' '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/telnetd4" '/etc/init.d/telnetd4'; mv "${pwd}/telnetd6" '/etc/init.d/telnetd6'
ln -s '../init.d/telnetd4' '/etc/rc.d/S50telnetd4' &
ln -s '../init.d/telnetd4' '/etc/rc.d/K50telnetd4' &
ln -s '../init.d/telnetd6' '/etc/rc.d/S50telnetd6' &
ln -s '../init.d/telnetd6' '/etc/rc.d/K50telnetd6' &

mkdir '/usr/sbin' > '/dev/null' 2>&1
mv "${pwd}/telnetd-login" '/usr/sbin/telnetd-login'

mkdir '/var/log' '/run/.telnetd' > '/dev/null' 2>&1
chown 'telnetd:telnetd' '/run/.telnetd' > '/dev/null' 2>&1 &

echo '[ "${TELNET}" = "1" ] && trap "kill \$(jobs -p) > /dev/null 2>&1" EXIT' >> '/etc/profile'

mkdir -p '/usr/share/doc/telnetd' > '/dev/null' 2>&1
mv "${pwd}/README.TXT" '/usr/share/doc/telnetd/README.TXT'
gzip -9 '/usr/share/doc/telnetd/README.TXT' &

echo 'packages: telnetd: setting net.ipv6.bindv6only to 1' > '/dev/kmsg'
echo -n '1' > '/proc/sys/net/ipv6/bindv6only'

cat "${pwd}/firewall.rc" >> '/etc/firewall.rc'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/dependencies.txt" "${pwd}/firewall.rc" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
