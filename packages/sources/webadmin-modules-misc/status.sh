#!/bin/sh
# webadmin-modules-misc package
# dummy status script

$(dirname "$(readlink -f "${0}")")/extras-status.sh ${@}

[ "${?}" = '1' ] && exit 1
exit 0
