#!/bin/sh
subsystem_name='tasks-v1'
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
			ln -s ../../${subsystem_name}/core_extensions.d/01_tasks-v1.rc .
		echo 'Linking to etc...'
			[ -e '../../../config' ] || mkdir ../../../config
			cd ../../../config
			for i in ../subsystems.d/${subsystem_name}/etc/*; do
				[ "${i}" = "../subsystems.d/${subsystem_name}/etc/*" ] && break
				ln -s ${i} .
			done
	;;
	'uninstall')
		echo 'Disabling subsystem...'
			rm ./.subsystem_enabled
		echo 'Removing core extension...'
			rm ../core/extensions.d/01_tasks-v1.rc
		echo 'Unlinking to etc...'
			cd ../../config
			for i in ../subsystems.d/${subsystem_name}/etc/*; do
				[ "${i}" = "../subsystems.d/${subsystem_name}/etc/*" ] && break
				rm ${i##*/}
			done
	;;
	*)
		echo 'usage: install|uninstall'
	;;
esac

exit 0
