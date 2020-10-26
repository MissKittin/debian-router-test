# init-log-kmsg
Save initramfs execution time, eg:  
`[    4.597012] init-log-kmsg: initrd phase ended, starting /sbin/init`

### Usage
Add `init=/usr/local/sbin/init-log-kmsg.sh` to kernel command line.  
**Make sure if `/sbin/init` exists (if not, OS will not start).**
