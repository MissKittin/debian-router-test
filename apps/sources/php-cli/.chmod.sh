#!/bin/sh
cd "$(dirname "$(readlink -f "${0}")")"
do_chown='false'

for i in .build.sh CHANGELOG.txt README.md VERSION.txt php; do
	${do_chown} && chown root:root ${i}
done

for i in .build.sh php; do
	chmod 755 ${i}
done

for i in CHANGELOG.txt README.md VERSION.txt; do
	chmod 644 ${i}
done

chmod 644 ./.chmod.sh
exit 0
