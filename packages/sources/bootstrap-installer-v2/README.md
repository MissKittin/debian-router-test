# bootstrap installer v2
Utility to install debian from debootstrap rootfs  
mainly designed for the rapid creation of virtual machines.

### Warning
**DO NOT INSTALL THIS PACKAGE ON A RUNNING OS**  
Bootloader installation on LVM and MD RAID is not supported

### Requirements
* **UEFI** EFI System Partition must be first on partition table and must be FAT32

### Required packages on host OS
* **bash** (also in the new system)
* **ping** with IPv6 support (can be disabled in settings)

### Supported disk interfaces
* ATA (hd[a-z][0-9])
* ATA (e)SATA SCSI USB (sd[a-z][0-9])
* virtio-blk (vd[a-z][0-9])
* Xen Virtual block (xvd[a-z][0-9])
* (e)MMC/SD (mmcblk[0-9]p[0-9])
* NVMe (nvme[0-9]n[0-9]p[0-9])
* Loopback (loop[0-9]p[0-9])

### Supported firmwares
* x86 BIOS
* x86 UEFI
* x64 UEFI

### Supported distros
Tested on
* Debian 5 Lenny  
	kernel is not installed by default  
	use `lenny-install-kernel.sh` script
* Debian 6 Squeeze  
	if the system does not boot,  
	define the rootfstype kernel parameter (e.g. `rootfstype=ext4`)  
	and run `update-initramfs -u`
* Debian 7 Wheezy
* Debian 8 Jessie
* Debian 9 Stretch
* Debian 10 Buster  
	XFCE4 desktop only with systemd
* Debian 11 Bullseye
* Ubuntu 15.04 Vivid Vervet  
	and its not working:  
	`E: Command line option --allow-downgrades is not understood`
* Ubuntu 18.04 Bionic Beaver
* Ubuntu 20.04 Focal Fossa
* Ubuntu 22.04 Jammy Jellyfish

### Supported desktop environments
* XFCE4
* IceWM/ROX-filer
* Ubuntu desktop (exclusively for ubuntu)

### How to make bootstrap
1) install debootstrap utility  
	`apt-get update`  
	`apt-get install -y debootstrap`
2) prepare directory for debootstrap (as root)  
	`mkdir ./debian`
3) `cd ./debian`
4) debootstrap debian (run as root)  
	`debootstrap --variant=minbase --arch CPU-ARCH DEBIAN-CODENAME . REPO-URL`  
	where `CPU-ARCH` is amd64 or i386  
	`DEBIAN-CODENAME` is OS codename (eg. buster or focal)  
	`REPO-URL` is `http://deb.debian.org/debian/` for debian or `http://archive.ubuntu.com/ubuntu/` for ubuntu
5) make tarball  
	`tar cvf ../debian.tar *`  
	`gzip -9 ../debian.tar`
6) now you can remove debootstrap directory  
	`cd ..`  
	`rm -r -f ./debian`

### Configuration
All configuration is in `etc` directory.  
File `bootstrap-installer.rc` will be used.  

Add your repositories in `bootstrap-installer-repos.rc`.  
They will be copied to the `/usr/local/etc/apt/sources.list.d/additional.list`.  
Remember to add keys for your repositories and remove `[trusted=yes]` after installation.  

You can create scripts in `/usr/local/etc`:
* `bootstrap-installer_pre-apt.sh` starts before installing packages  
	you can put `install.sh --force` for eg. `fake libpam systemd` package
* `bootstrap-installer_post-apt.sh` starts after installing packages
* `bootstrap-installer_last.sh` starts after the installation is completed

**remember to chmod 755 the above files**

### How to install
1) prepare directory for bootstrap installer  
	`mkdir ./installer`
2) `cd ./installer`
3) create rootfs directories  
	`mkdir ./usr ./usr/local ./usr/local/etc ./usr/local/sbin ./usr/local/share ./usr/local/share/packages`
4) now move `bootstrap-installer` directory to the `./usr/local/share/packages`  
	(`packages` directory can be named as you like)
5) run installer  
	`./usr/local/share/packages/bootstrap-installer-v2/install.sh --force`
6) create tarball  
	`tar cvf ../installer.tar *`  
	`gzip -9 ../installer.tar`
7) now you can remove installer directory  
	`cd ..`  
	`rm -r -f ./installer`

### How to use
1) partition hdd
2) format root partition as ext4 (or selected root fs type in config)
3) run your favourte linux distro in target computer
4) transfer all files to target computer
5) create mountpoint  
	`mkdir /debian`
6) mount root partition  
	`mount /dev/your-root-partition /debian`
7) `cd /debian`
8) if you have separated partitions (eg. for home or usr etc etc) make mountpoints and mount that partitions now
9) unpack rootfs  
	`tar xvf /path/to/debian.tar`
10) unpack installer  
	`tar xvf /path/to/installer.tar`
11) run installer  
	`./usr/local/sbin/bootstrap-installer.sh`  
	or with specified root partition (if cannot detect automatically):  
	`./usr/local/sbin/bootstrap-installer.sh /dev/root-partition`  
	(bootstrap-installer will be uninstalled automatically)
12) you can now chroot and install packages from debian-router repo
13) if you have completed step 8, umount that partitions
14) umount root partition  
	`cd /`  
	`umount /debian`
15) reboot from hdd
16) if debian booted successfully, you can remove bootstrap installer (run as root)  
	`rm -r -f /usr/local/share/packages/bootstrap-installer-v2`  
	or if you haven't installed other packages from the debian-router repository  
	`rm -r -f /usr/local/share/packages`  
	(see `How to install` step `4`)

### Package preseeding
(You can use `make-offline-preseed.sh` tool)
1) create `bootstrap-installer-preseed-dump` file on new root fs and install OS
2) prepare other machines
3) after installation move `bootstrap-installer-preseed.tar.gz` from new rootfs to the other machines
4) you can disable ping here (but you don't have to)  
	`echo 'unset check_internet_connection' >> ./usr/local/etc/bootstrap-installer.rc`
5) install OS on the next machine
6) repeat step 4

# quick-format.sh
A simple script that automatically wipes the disk and creates MBR or GPT partitions:
* `EFI system partition` FAT32 100MiB (only GPT)
* EXT4 from 0% to 100% (MBR) or from 100MiB to 100% (GPT)

Required programs:
* `dd`
* `blockdev` (only GPT)
* `cat`
* MBR: `parted` or `fdisk` or `busybox` with fdisk
* GPT: `parted` or `gdisk`
* `mkfs.vfat` (only GPT)
* `mkfs.ext4`

**Warning!** The script doesn't ask for anything!

# make-offline-preseed.sh
Offline `bootstrap-installer-preseed.tar.gz` creation tool.  
Use this to skip the first install from the package predeeding section.
