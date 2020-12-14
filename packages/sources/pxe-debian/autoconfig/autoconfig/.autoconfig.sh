#!/bin/sh

if [ "${3}" = 'post' ]; then
	for autoconfigscript in ${1}/autoconfig.pre.d/S*.rc; do
		[ "${autoconfigscript}" = "${1}/autoconfig.pre.d/S*.rc" ] && break
		. ${autoconfigscript}
	done

	if [ -e "${1}/rootfs.post" ]; then
		pwd="$(pwd)"
		cd ${1}/rootfs.post
		tar cf - * 2>/dev/null | tar xf - -C / > /dev/null 2>&1
		tar cf - --exclude='.' --exclude='..' .* 2>/dev/null | tar xf - -C / > /dev/null 2>&1
		chmod 777 /tmp
		chmod 777 /var/tmp
		cd ${pwd}
		unset pwd
	fi

	for autoconfigscript in ${1}/autoconfig.post.d/S*.rc; do
		[ "${autoconfigscript}" = "${1}/autoconfig.post.d/S*.rc" ] && break
		. ${autoconfigscript}
	done

	exit 0
fi

if [ -e "${1}/rootfs.pre" ]; then
	pwd="$(pwd)"
	cd ${1}/rootfs.pre
	tar cf - * 2>/dev/null | tar xf - -C / > /dev/null 2>&1
	tar cf - --exclude='.' --exclude='..' .* 2>/dev/null | tar xf - -C / > /dev/null 2>&1
	chmod 777 /tmp
	chmod 777 /var/tmp
	cd ${pwd}
	unset pwd
fi

${0} "${1}" "${2}" post &

exit 0
