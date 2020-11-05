# PXE Debian autoconfig
1) copy this directory to the destination disk (place in the root)  
	and rename to `.pxe-debian`
2) edit `autoconfig.rc`
3) edit configs in `autoconfig/autoconfig.cfg.d`
4) place system configurations in `autoconfig/rootfs.pre`
5) place packages configurations in `autoconfig/rootfs.post`
6) run PXE Debian
7) run `sign-autoconfig.sh .YOUR_DISK_LABEL_IN_MNT`  
	where `YOUR_DISK_LABEL_IN_MNT` is eg `.sda1`  
	see `/media` directory on running PXE Debian
8) reboot
