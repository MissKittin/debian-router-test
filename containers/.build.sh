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

chmod 644 .build.sh
exit 0
