#!/bin/sh

cd "$(dirname "$(readlink -f ${0})")/.."
for i in *; do
	if [ -L "${i}" ]; then
		echo ''
		echo " ${i} is a link, ommiting"
	elif [ -e "${i}/.no-auto-setup" ]; then
		echo ''
		echo " ${i} has .no-auto-setup, ommiting"
	elif [ -e "${i}/setup.sh" ]; then
		echo ''
		echo " ${i}"
		${i}/setup.sh ${@}
	fi 
done
echo ''

exit 0
