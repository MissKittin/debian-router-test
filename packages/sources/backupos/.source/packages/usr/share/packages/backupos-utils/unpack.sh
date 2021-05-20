#!/bin/sh
pwd="$(pwd)"

# bins
mkdir '/usr/bin' > '/dev/null' 2>&1
mv "${pwd}/df-rootfs" "/usr/bin/df-rootfs"

# sbins
mkdir '/usr/sbin' > '/dev/null' 2>&1
for i in 'dpkg-forget-old-unavail' 'fsck.auto' 'load-drivers' 'mount.cifs' 'mount.ext4' 'mount.cdrom.iso9660' 'mount.nfs' 'mount.vfat' 'ntpdate' 'reboot-to-main' 'swaps' 'umount-all' 'zram-swap'; do
	mv "${pwd}/${i}" "/usr/sbin/${i}"
done
ln -s 'mount.cdrom.iso9660' '/usr/sbin/mount.cdrom.udf' &

# mdev
mkdir '/etc/init.d' '/etc/rc.d' > '/dev/null' 2>&1
mv "${pwd}/mdev" '/etc/init.d/mdev'
ln -s '../init.d/mdev' '/etc/rc.d/S20mdev' &

# runit
mkdir '/var/service' '/var/service/getty-tty2' '/var/log' > '/dev/null' 2>&1
echo -n '' > '/var/log/wtmp'
mv "${pwd}/getty-tty2" "/var/service/getty-tty2/run"

# mdev log
ln -s '/dev/mdev.log' '/var/log/mdev.log' &

# dpkg
mkdir -p '/var/lib/dpkg/info' > '/dev/null' 2>&1
echo -n '' > '/var/lib/dpkg/status'

# cleaner
mv "${pwd}/backupos-cleaner" '/etc/rc.d/S99backupos-cleaner'

# docs
mkdir -p '/usr/share/doc/backupos-utils' > '/dev/null' 2>&1
mv "${pwd}/README.TXT" '/usr/share/doc/backupos-utils/README.TXT'
gzip -9 '/usr/share/doc/backupos-utils/README.TXT' &

# autologin
sed -i "s/'\/bin\/getty'/'\/bin\/getty' -n -l '\/usr\/sbin\/login-root'/g" '/lib/init/init-console' > '/dev/null' 2>&1
mv "${pwd}/login-root" '/usr/sbin/login-root'

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/dependencies.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi
exit 0
