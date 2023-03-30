# BackupOS
Modular RAM-based OS designed for headless systems  
Version 2.0

### Requirements
* i686 (x86) compatible CPU
* 128MB RAM without `packages.img` (`rootfs.img` `rootfs-bin.img` and `modules.img`)
* 192MB RAM with `packages.img`
* 320MB RAM with `firmware.img`
* 384MB RAM with `packages.img` and `firmware.img`

### Features
* Linux kernel 4.19.0
* BusyBox 1.30.0
* helpers for mount: ISO 9660, UDF, SMB/CIFS, EXT4, NFS, FAT32/vFAT
* deb packages support (not packages from debian repo)
* runit process supervisor
* zram swap (on demand)
* cron (disabled by default)
* cfdisk partition tool
* EXT fs tools
* MS FAT tools
* ddrescue
* hdparm
* Midnight Commander
* FTP server
* xtables firewall
* ntpdate clock sync script
* TestDisk & PhotoRec
* user-friendly telnet menu

### Parts
* `vmlinuz` -> linux kernel (i686)
* `modules.img` -> kernel drivers (i686)
* `rootfs.img` -> BackupOS base file system tree
* `rootfs-bin.img` -> BusyBox (i686)
* `packages.img` -> BackupOS utilities, daemons and extras (i686)

### How to boot
Add grub entry from `sample-config/grub.cfg` and edit kernel command line, where
* `nodhcp` -> do not use dhcp client
* `network_ip` -> first block of ip (eg. `network_ip=10.0.0`)
* `start_ip` -> for each NIC ip will be assigned sequentially from this number (eg. `start=20`)
* `netmask` -> in `*.*.*.*` format (eg. `netmask=255.255.255.0`)
* `bridge_mac` -> specify mac address for the bridge (eg. `bridge_mac=12:34:56:78:9a:bc`)
* `telnet_password` -> `telnetd` package parameter, for "security" reasons (eg. `telnet_password=mysecretpassword`)

Connect via ssh and type `backupos.sh`.  
Now close ssh, open telnet connection and login with listed password.

### How to use
All docs are in `/usr/share/doc`. Boot BackupOS, `cd doc` and use `mc` to browse/read documentation.  
To read docs from telnet menu, enter `Run program` -> `Midnight Commander`, navigate to `/usr/share/doc` and use `F3` to display selected file.
