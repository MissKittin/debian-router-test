#!/bin/sh
subsystem_name='eol'
cd "$(dirname "$(readlink -f "${0}")")"

if [ ! -e '../core' ]; then
	echo 'core subsystem not installed'
	exit 1
fi

case $1 in
	'install')
		echo 'Enabling subsystem...'
			echo -n '' > ./.subsystem_enabled
		echo 'Installing core extension...'
			cd ../core/extensions.d
			ln -s ../../${subsystem_name}/core_extensions.d/99_eol.rc .
	;;
	'uninstall')
		echo 'Disabling subsystem...'
			rm ./.subsystem_enabled
		echo 'Removing core extension...'
			rm ../core/extensions.d/99_eol.rc
	;;
	*)
		echo 'usage: install|uninstall'
	;;
esac

exit 0
