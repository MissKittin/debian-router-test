#!/bin/sh
pwd=$(pwd)
cd /usr/bin
for i in boot_to_main mount-cifs mount-ext4; do
	ln -s ${pwd}/${i} ./${i}
done
rm ${pwd}/unpack.sh
exit 0
