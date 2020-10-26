# BackupOS
Small modular RAM-based OS designed for headless systems (v1.1).  
Some code taken from `android-x86-2.2-generic.iso`.

### How to boot
Add grub entry from `sample-config/grub.cfg` and edit kernel command line, where
* `nodhcp` -> do not use dhcp client
* `network_ip` -> first block of ip
* `start_ip` -> for each NIC ip will be assigned sequentially from this number
* `netmask` -> in `*.*.*.*` format
* `telnet_password` -> `telnetd` package parameter, for security reasons

Connect via ssh and type `boot_to_backupos.sh`.  
Open telnet and login with listed password.

### How to use
* `telnet-menu` -> console GUI [`telnet-menu` package]
* `mount-ext4` -> load modules and mount ext4 fs [`backupos-utils` package]
* `mount-cifs` -> load modules and mount SMB share [`backupos-utils` package]
* `boot_to_main` -> remove BackupOS indicator created by `boot_to_backupos.sh` and boot main OS (remember to umount filesystems) [`backupos-utils` package]

### Details
Kernel: Linux 4.19.0 (`linux-image-4.19.0-3-686-unsigned_4.19.20-1_i386.deb` from debian repo)  
Userspace: Busybox 1.27.2 (`busybox-static_1.27.2-3_i386.deb` from debian repo)  
Additional packages: `backupos-utils`, `bash`, `mc`, `ncurses-base`, `telnetd`, `telnet-menu`  
Required initramfs: `rootfs.img`, `rootfs-bin.img`, `modules.img-*`

### More info
Read `etc/README.TXT` in `rootfs.img` (gzipped cpio archive)  
or `zcat /etc/README.TXT.gz` on live OS.
