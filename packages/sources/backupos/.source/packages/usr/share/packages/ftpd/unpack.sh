#!/bin/sh
pwd="$(pwd)"

# busybox issue: ftpd can not chroot if is not running as root
#addgroup -S 'ftpd' > '/dev/null' 2>&1
#adduser -g '' -S -G 'ftpd' -H -h '/home/ftp' 'ftpd' > '/dev/null' 2>&1
#DAEMON_UID="$(id -u 'ftpd')"
#DAEMON_GID="$(id -g 'ftpd')"

mkdir '/etc/init.d' '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/ftpd4" '/etc/init.d/ftpd4'; mv "${pwd}/ftpd6" '/etc/init.d/ftpd6'
ln -s '../init.d/ftpd4' '/etc/rc.d/S50ftpd4' &
ln -s '../init.d/ftpd4' '/etc/rc.d/K50ftpd4' &
ln -s '../init.d/ftpd6' '/etc/rc.d/S50ftpd6' &
ln -s '../init.d/ftpd6' '/etc/rc.d/K50ftpd6' &

mkdir '/home/ftp' > '/dev/null' 2>&1
#mount -t 'tmpfs' -o 'rw,nosuid,nodev,noexec,noatime,nodiratime,mode=755,uid='"${DAEMON_UID}"',gid='"${DAEMON_GID}" 'ftp' '/home/ftp' &
#echo 'ftp /home/ftp tmpfs auto,rw,nosuid,nodev,noexec,noatime,nodiratime,mode=755,uid='"${DAEMON_UID}"',gid='"${DAEMON_GID}"' 0 0' >> '/etc/fstab'
mount -t 'tmpfs' -o 'rw,nosuid,nodev,noexec,noatime,nodiratime,mode=755' 'ftp' '/home/ftp' &
echo 'ftp /home/ftp tmpfs auto,rw,nosuid,nodev,noexec,noatime,nodiratime,mode=755 0 0' >> '/etc/fstab'

mkdir '/var/log' > '/dev/null' 2>&1

echo 'packages: ftpd: setting net.ipv6.bindv6only to 1' > '/dev/kmsg'
echo -n '1' > '/proc/sys/net/ipv6/bindv6only'

cat "${pwd}/firewall.rc" >> '/etc/firewall.rc'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/firewall.rc" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
