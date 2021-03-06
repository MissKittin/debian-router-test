Use qemu from other debian version
Tested on buster (host) and stretch (container).
Sudo is required!

Qemu in buster has one big disadvantage for me - don't have SDL or GTK, only VNC.
On my desktop I require window with vm.

If you want too, just use this container:
bootstrap debian stretch (or other version), make squashfs image with stretch rootfs,
and place it in .rootfs.sqs
After that, run `./start.sh` (as root)
and use `./qemu-system-x86_64.sh` as normal qemu binary (run as user).

If you don't use qemu SDL output, this container is purposeless.
