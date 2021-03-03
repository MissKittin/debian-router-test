#!/bin/sh
subsystem_name='TEMPLATE'
cd "$(dirname "$(readlink -f "${0}")")"

# Dependency check
#if [ ! -e '../sample' ]; then
#	echo 'sample subsystem not installed'
#	exit 1
#fi

case $1 in
	'install')
		echo 'Enabling subsystem...'
			echo -n '' > ./.subsystem_enabled
	;;
	'uninstall')
		echo 'Disabling subsystem...'
			rm ./.subsystem_enabled
	;;
	*)
		echo 'usage: install|uninstall'
	;;
esac

exit 0
