#!/bin/sh
echo ''

cd "$(dirname "$0")"
for i in */dependencies.txt; do
	[ "$i" = '*/dependencies.txt' ] && break

	echo -n "$i" | sed -e 's\/dependencies.txt\\g'; echo ':'
	for x in $(cat ${i}); do
		[ -e ./${x} ] && echo "  [ OK ] ${x}" || echo "  [FAIL] ${x}"
	done
done

echo ''
exit 0
