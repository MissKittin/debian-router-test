# PXE Debian mastering toolbox

### Required packages available in repo (mastered os)
* `busybox-static` for first phase of boot and basic tools
* `kmod` for kernel modules support
* `sysvinit-core` init package
* `udev` device manager

### Recommended packages for mastering
* `debootstrap` that supports debian buster (for `pxe-debian-toolbox.sh bootstrap`)

### Mastering tutorial
You can make your corrections after each step
1) copy this directory to the build OS
2) run `pxe-debian-toolbox.sh bootstrap ARCH` where ARCH is amd64 or i386  
	or `mkdir rootfs` and put rootfs into this directory
3) run `pxe-debian-toolbox.sh bootstrap-clear` (if you used `bootstrap` command)
4) run `pxe-debian-toolbox.sh install-packages`
5) run `pxe-debian-toolbox.sh strip` to remove unnecessary files (ignore errors)
6) put `pxe-debian` and other packages to the eg `usr/local/share/packages`
7) run `pxe-debian-toolbox.sh install-pxe-debian-package usr/local/share/packages/package`  
	repeat this step for all packages
8) run `pxe-debian-toolbox.sh strip noapt` (ignore errors)
9) run `pxe-debian-toolbox.sh setup-boot-queue` to setup sysvinit
10) run `pxe-debian-toolbox.sh mkinitrd` to create first part of initial ramdisk
11) run `pxe-debian-toolbox.sh mkinitrd-bin` to create second part
12) run `pxe-debian-toolbox.sh mksquashfs-rootfs` to create root filesystem image
13) run `pxe-debian-toolbox.sh mksquashfs-kernel linux-image-package kernel-arch`  
	where `linux-image-package` is kernel name in repo (eg. `linux-image-amd64`)  
	`kernel-arch` is eg `amd64` or `686` etc etc  
	if you want to build amd64 kernel image on i386 debian, add `amd64` at the end of the command line
14) run `pxe-debian-toolbox.sh make-pxe-directory`
15) run `pxe-debian-toolbox.sh make-syslinux-config path/to/pxe/debian`  
	where `path/to/pxe/debian` is path from syslinux root to pxe-debian files (can be empty),  
	edit `img/menu.cfg`  
	if you using debian-router pxe solution, type `pxe-debian-toolbox.sh make-syslinux-config root`
16) run `pxe-debian-toolbox.sh make-syslinux-autoboot kernel path/to/pxe/debian`  
	where `kernel` is directory name with kernel (eg. amd64 or 686),  
	`path/to/pxe/debian` is path from syslinux root to pxe-debian files (can be empty),  
	edit `img/menu-autoboot.cfg`  
	if you using debian-router pxe solution, type `pxe-debian-toolbox.sh make-syslinux-autoboot kernel root`  
	cd to pxelinux.cfg and `ln -s ../../root/pxe-debian/menu-autoboot.cfg 00-11-22-33-44-55-66`  
	where `00-11-22-33-44-55-66` is client MAC address (you can read this value from `dnsmasq-tftp` in syslog)
17) run `pxe-debian-toolbox.sh make-tarball`
18) send `pxe-debian.tar.gz` to the server, unpack and deploy

### Updating kernel (on running PXE Debian)
1) run `apt-get update`
2) run `check-kernel-update.sh`
3) if update available, run `update-current-kernel.sh`
4) send files from `/pxe-debian` to the server

### Installing new kernel (on running PXE Debian)
1) run `apt-get update`
2) run `make-kernel-image`
3) send files from `/pxe-debian` to the server
4) edit bootloader configuration

### Maintenance installation (on running PXE Debian)
1) unpack rootfs image to the `dev-tools/rootfs`:  
	`cat rootfs.img | cpio -id`  
	`cd ./img`  
	`unsquashfs ./rootfs.sqs`  
	`mv ./squashfs_root ../../rootfs`  
	`cd ../..`  
	`rm -r -f ./img`
2) do maintenance tasks
3) follow steps 5, 9 and 12 from Mastering tutorial
4) send `img/rootfs.img` to the server

### .load-modules.sh
Run this script to load kernel modules when PXE Debian is not running (`debuginitrd` kernel parameter)
