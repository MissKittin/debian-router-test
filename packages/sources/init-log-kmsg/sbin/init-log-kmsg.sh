#!/bin/sh
echo 'init-log-kmsg: initrd phase ended, starting /sbin/init' > /dev/kmsg
exec /sbin/init $@
