# PXE Debian mastering toolbox

### Required packages available in repo (mastered os)
* `busybox-static` for first phase of boot and basic tools
* `kmod` for kernel modules support
* `sysvinit-core` init package
* `udev` device manager

### Recommended packages for mastering
* `debootstrap` that supports debian buster (for `pxe-debian-toolbox.sh bootstrap`)

### Mastering tutorial
1) copy this directory to the build OS
2) run `pxe-debian-toolbox.sh bootstrap ARCH` where ARCH is amd64 or i386  
	or `mkdir rootfs` and put rootfs into this directory
3) run `pxe-debian-toolbox.sh bootstrap-clear` (if you used `bootstrap` command)
4) run `pxe-debian-toolbox.sh install-packages`
5) run `pxe-debian-toolbox.sh strip` to remove unnecessary files
6) put `pxe-debian` and other packages to the eg `usr/local/share/packages`
7) run `pxe-debian-toolbox.sh install-pxe-debian-package usr/local/share/packages/package`  
	repeat this step for all packages
8) run `pxe-debian-toolbox.sh setup-boot-queue` to setup sysvinit
9) run `pxe-debian-toolbox.sh mkinitrd` to create first part of initial ramdisk
10) run `pxe-debian-toolbox.sh mkinitrd-bin` to create second part
11) run `pxe-debian-toolbox.sh mksquashfs-rootfs` to create root filesystem image
12) run `pxe-debian-toolbox.sh mksquashfs-kernel linux-image-package`  
	where `linux-image-package` is kernel name in repo (eg. `linux-image-amd64`)  
	if you want to build amd64 kernel image on i386 debian, add `amd64` at the end of the command line
13) run `pxe-debian-toolbox.sh make-tarball`
14) send `pxe-debian.tar.gz` to the server and deploy

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
3) follow steps 5, 8 and 11 from Mastering tutorial
4) send `img/rootfs.img` to the server