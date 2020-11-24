#!/bin/sh
cd "$(dirname "$(readlink -f "${0}")")"
do_chown='false'

for dir in ./root ./pxelinux/root ./pxelinux/modules ./pxelinux/memdisk ./pxelinux/pxelinux; do
	mkdir ${dir}
done

find -type d | while read dir; do
	${do_chown} && chown root:root ${dir}
	chmod 755 ${dir}
done

find -type f | while read file; do
	${do_chown} && chown root:root ${file}
	chmod 644 ${file}
done

chmod 755 ./pxelinux/update-links.sh
ln -s ../pxelinux/root ./root/.pxelinux

rm ./.build.sh
exit 0
