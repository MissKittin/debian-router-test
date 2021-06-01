#!/bin/sh
# Dump all symbolic links of the package

if [ "${1}" = '--no-cd' ]; then
	PACKAGE_NAME="${2}"
else
	PACKAGE_NAME="${1}"
	cd "$(dirname "$(readlink -f "${0}")")/../.."
fi

if [ ! "$(whoami)" = 'root' ]; then
	echo 'root required'
	exit 1
fi
if [ "${1}" = '' ]; then
	echo 'dumpsymlinks.sh package-name'
	exit 1
fi
if [ ! -e "./${PACKAGE_NAME}" ]; then
	echo "package ${1} not exists"
	exit 1
fi

cd "./${PACKAGE_NAME}"

# content
find -type l | while read line; do
	echo "ln -s $(readlink ${line}) ${line}"
done

exit 0
