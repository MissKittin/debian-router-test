#!/bin/sh

### Warning
# this script will disable the ability
# to add files to the boot sequence via initrd

cd "$(dirname "$(readlink -f "${0}")")/../../../etc/init" || exit 1
[ ! -d './cache' ] && mkdir './cache'

echo 'Caching S'
rm './cache/init-cache.S' > '/dev/null' 2>&1
for i in S*_*.rc; do
	[ "${i}" = 'S*_*.rc' ] && break
	echo " processing ${i}"
	cat "${i}" >> './cache/init-cache.S'
	echo '' >> './cache/init-cache.S'
done

echo 'Caching K'
rm './cache/init-cache.K' > '/dev/null' 2>&1
for i in K*_*.rc; do
	[ "${i}" = 'K*_*.rc' ] && break
	echo " processing ${i}"
	cat "${i}" >> './cache/init-cache.K'
	echo '' >> './cache/init-cache.K'
done

echo 'Cleaning cache files'
for i in './cache/init-cache.S' './cache/init-cache.K'; do
	sed -i -e '/^[ \t]*#/d' "${i}"
	sed -i '/^$/d' "${i}"
	sed -i -e 's/^[ \t]*//' "${i}"
done

exit 0
