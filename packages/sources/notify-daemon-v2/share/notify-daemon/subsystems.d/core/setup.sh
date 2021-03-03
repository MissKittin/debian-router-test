#!/bin/sh
subsystem_name='core'
cd "$(dirname "$(readlink -f "${0}")")"

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
