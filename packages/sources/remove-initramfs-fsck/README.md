# remove-initramfs-fsck
Simple hack that removes rootfs check from initramfs.  
fsck will be executed by `checkroot.sh` (in sysvinit).

### Applying
Add `/boot/initrd-fsck-patch.img` to initrd command in `grub.cfg` eg:  
`initrd /initrd.img /boot/initrd-fsck-patch.img`

### fsck log
Log will be normally saved in `/var/log/fsck`.
