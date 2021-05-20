#!/bin/sh
pwd="$(pwd)"

mkdir '/usr/sbin' > '/dev/null' 2>&1
for i in 'fsck' 'mkfs'; do
	mv "${pwd}/${i}.fat" "/usr/sbin/${i}.fat"
	ln -s "${i}.fat" "/usr/sbin/${i}.vfat" &
done

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	rm "${pwd}/source.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
