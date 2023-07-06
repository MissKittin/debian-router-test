#!/bin/sh
cd "$(dirname "$(readlink -f "${0}")")"
do_chown='false'

find -type d | while read dir; do
	${do_chown} && chown root:root ${dir}
	chmod 755 ${dir}
done

find -type f | while read file; do
	${do_chown} && chown root:root ${file}
	chmod 755 ${file}
done

find -type f -name '*.sh' | while read script; do
	${do_chown} && chown root:root ${script}
	chmod 755 ${script}
done
find -type f -name '.autoboot.example' | while read script; do
	${do_chown} && chown root:root ${script}
	chmod 755 ${script}
done

for i in *; do
	[ ! "${i}" = 'qemu-system' ] && for x in start.sh stop.sh console.sh service.sh; do
		ln -s ../.samples/plain-overlay/${x} ./${i}/${x}
	done
done
for x in start.sh stop.sh; do
	ln -s ../.samples/plain-squash/${x} ./qemu-system/${x}
done

for i in miredo; do
	for x in start.sh stop.sh console.sh service.sh; do
		ln -s ../.samples/plain-overlay/ns-${x} ./${i}/ns-${x}
	done
done

chmod 644 .build.sh
exit 0
