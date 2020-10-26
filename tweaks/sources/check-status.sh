#!/bin/sh
# Check installed tweaks
PACKAGES_DIR="$(dirname "${0}")"

echo ''
for i in ${PACKAGES_DIR}/*; do
	if [ -x $i/status.sh ]; then
		$i/status.sh > /dev/null 2>&1
		retVal=$?
		if [ "$retVal" = '2' ]; then
			echo -n ' [broken]        '
			echo "$i" | sed -e 's\'"${PACKAGES_DIR}"'/\\g'
		elif [ "$retVal" = '0' ]; then
			echo -n ' [installed]     '
			echo "$i" | sed -e 's\'"${PACKAGES_DIR}"'/\\g'
		else
			echo -n ' [not installed] '
			echo "$i" | sed -e 's\'"${PACKAGES_DIR}"'/\\g'
		fi
		unset retVal
	fi
done
echo ''

exit 0
