#!/bin/sh
# Package manager - main script
# 12.06.2020

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Find path
export PACKAGES_DIR="$(readlink -f "$(dirname "$(readlink -f "$0")")/../..")"

# Available parameters
pm_avail_params()
{
	#echo -n ' Available parameters: '
	echo ' Available parameters:'
	for i in ${PACKAGES_DIR}/.package-manager/modules/*; do
		#echo -n "${i##*/} " | sed -e 's/.sh//g'
		#echo -n "${i##*/} "
		echo "   ${i##*/}"
	done
	echo ''
}

if [ "$(ls ${PACKAGES_DIR}/.package-manager/modules/ 2>/dev/null)" = '' ]; then
	echo ' E No modules found'
	exit 1
fi

if [ "$1" = '' ]; then
	echo ' ! No parameters'
	pm_avail_params
	exit 1
fi

if [ -e "${PACKAGES_DIR}/.package-manager/modules/${1}" ]; then
	exec ${PACKAGES_DIR}/.package-manager/modules/${1} $2 $3 $4 $5 $6 $7 $8 $9
else
	echo ' ! Wrong parameter'
	pm_avail_params
fi

exit 0
