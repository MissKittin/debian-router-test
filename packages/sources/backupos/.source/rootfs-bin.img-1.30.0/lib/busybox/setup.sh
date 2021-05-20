#!/bin/sh
cd "$(dirname "$(readlink -f "${0}")")"

APPLETS="$(./busybox '--list-full')"
BINARIES="$(ls)"

cd '../..'
[ ! -e './bin' ] && mkdir './bin'
cd './bin'

for i in ${APPLETS}; do
	echo "Installing applet ${i##*/}"
	ln -s '../lib/busybox/busybox' "./${i##*/}"
done

for i in ${BINARIES}; do
	if [ ! "${i}" = 'busybox' ] && [ ! "${i}" = "${0##*/}" ]; then
		echo "Installing binary ${i}"
		[ -e "${i}" ] && rm "${i}"
		ln -s "../lib/busybox/${i}" "./${i}"
	fi
done

exit 0
