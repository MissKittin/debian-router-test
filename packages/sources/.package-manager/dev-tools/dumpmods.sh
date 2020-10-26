#!/bin/sh
# Dump permissions of the package

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
	echo 'dumpmods.sh package-name'
	exit 1
fi
if [ ! -e "./${PACKAGE_NAME}" ]; then
	echo "package ${1} not exists"
	exit 1
fi

cd "./${PACKAGE_NAME}"

# header
if [ -e '/tmp/custom-header.rc' ]; then
	. /tmp/custom-header.rc
else
	echo '#!/bin/sh'
	echo "do_chown='false'"
	echo 'cd "$(dirname "$(readlink -f "${0}")")"'
	echo ''
fi

# content
find -not -type l | while read line; do
	echo '${do_chown} && chown root:root '"${line}"
	echo "chmod $(stat -c '%a' ${line}) ${line}"
done

# footer
if [ -e '/tmp/custom-footer.rc' ]; then
	. /tmp/custom-footer.rc
else
	echo ''
	echo 'chmod 644 ./.build.sh'
	echo 'exit 0'
fi

exit 0
