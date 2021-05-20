#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/sbin' > '/dev/null' 2>&1
for i in 'e2fsck' 'mke2fs' 'resize2fs' 'tune2fs'; do
	mv "${pwd}/${i}" "/usr/sbin/${i}"
done
for i in 2 3 4; do
	ln -s 'mke2fs' "/usr/sbin/mkfs.ext${i}" &
	ln -s 'e2fsck' "/usr/sbin/fsck.ext${i}" &
done

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/source.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
