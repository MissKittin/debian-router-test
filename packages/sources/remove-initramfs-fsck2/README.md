# remove-initramfs-fsck2
Simple hack that removes rootfs check from initramfs.  
fsck will be executed by `checkroot.sh` (in sysvinit).
Version for debian bullseye

### Applying
Add `/boot/initrd-fsck-patch2.img` to initrd command in `grub.cfg` eg:  
`initrd /initrd.img /boot/initrd-fsck-patch2.img`

### fsck log
Log will be normally saved in `/var/log/fsck`.
