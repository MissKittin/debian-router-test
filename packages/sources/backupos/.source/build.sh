#!/bin/sh
# BackupOS - build script
echo -n 'Setting up BackupOS images...'
cd "$(dirname "$(readlink -f "${0}")")"

# rootfs-bin
cd ./rootfs-bin/bin
for i in [ [[ acpid adjtimex ar arp arping ash awk basename blkdiscard blockdev brctl bunzip2 bzcat bzip2 cal cat chgrp chmod chown chroot chvt clear cmp cp cpio crond crontab cttyhack cut date dc dd deallocvt depmod devmem df diff dirname dmesg dnsdomainname dos2unix dpkg dpkg-deb du dumpkmap dumpleases echo ed egrep env expand expr factor fallocate false fatattr fdisk fgrep find fold free freeramdisk fsfreeze fstrim ftpget ftpput getopt getty grep groups gunzip gzip halt head hexdump hostid hostname httpd hwclock i2cdetect i2cdump i2cget i2cset id ifconfig ifdown ifup init insmod ionice ip ipcalc ipneigh kill killall klogd last less link linux32 linux64 linuxrc ln loadfont loadkmap logger login logname logread losetup ls lsmod lsscsi lzcat lzma lzop md5sum mdev microcom mkdir mkdosfs mke2fs mkfifo mknod mkpasswd mkswap mktemp modinfo modprobe more mount mt mv nameif nc netstat nl nproc nsenter nslookup od openvt partprobe passwd paste patch pidof ping ping6 pivot_root poweroff printf ps pwd rdate readlink realpath reboot renice reset rev rm rmdir rmmod route rpm rpm2cpio run-parts sed seq setkeycodes setpriv setsid sh sha1sum sha256sum sha512sum shred shuf sleep sort ssl_client start-stop-daemon stat strings stty su sulogin svc swapoff swapon switch_root sync sysctl syslogd tac tail tar taskset tee telnet telnetd test tftp time timeout top touch tr traceroute traceroute6 true truncate tty tunctl ubirename udhcpc udhcpd uevent umount uname uncompress unexpand uniq unix2dos unlink unlzma unshare unxz unzip uptime usleep uudecode uuencode vconfig vi w watch watchdog wc wget which who whoami xargs xxd xz xzcat yes zcat; do
	ln -s busybox ${i}
done
cd ../..

# rootfs
cd ./rootfs
for i in dev mnt proc run sys tmp var; do
	mkdir ${i}
done
cd ./var
for i in run tmp; do
	ln -s ../${i} ${i}
done
cd ../..

# packages
cd ./packages/usr
mkdir bin
cd ./bin
for i in package-installer package-starter; do
	ln -s ../share/package-manager/${i} ${i}
done
cd ../../..

echo ' [done]'
exit 0
