#!/bin/bash
export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
modprobe='modprobe'

load_modules()
{
    d2m=/tmp/dev2mod
    echo 'dev2mod() { while read dev; do case $dev in' >> $d2m
    # Original version --->
    #   sort -r /lib/modules/`uname -r`/modules.alias | \
    #       sed -n 's/^alias  *\([^ ]*\)  *\(.*\)/\1)modprobe \2;;/p' >> $d2m
    # <---
    sort -r /lib/modules/`uname -r`/modules.alias | \
        sed -n 's/^alias  *\([^ ]*\)  *\(.*\)/\1)'"$modprobe"' \2;;/p' >> $d2m
    echo 'esac; done; }' >> $d2m
    source $d2m
    cat /sys/bus/*/devices/*/modalias | dev2mod
    cat /sys/devices/virtual/wmi/*/modalias | dev2mod
}

load_modules
exit 0
