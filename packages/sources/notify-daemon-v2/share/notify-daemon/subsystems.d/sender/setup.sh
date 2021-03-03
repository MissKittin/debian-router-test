#!/bin/sh
subsystem_name='sender'
cd "$(dirname "$(readlink -f "${0}")")"

case $1 in
	'install')
		echo 'Enabling subsystem...'
			echo -n '' > ./.subsystem_enabled
		echo 'Linking to share...'
			cd ../..
			for i in ./subsystems.d/${subsystem_name}/share/*; do
				[ "${i}" = "./subsystems.d/${subsystem_name}/share/*" ] && break
				ln -s ${i} .
			done			
		echo 'Linking to etc...'
			[ -e './config' ] || mkdir ./config
			cd ./config
			for i in ../subsystems.d/${subsystem_name}/etc/*; do
				[ "${i}" = "../subsystems.d/${subsystem_name}/etc/*" ] && break
				ln -s ${i} .
			done
	;;
	'uninstall')
		echo 'Disabling subsystem...'
			rm ./.subsystem_enabled
		echo 'Unlinking from share...'
			cd ../..
			for i in ./subsystems.d/${subsystem_name}/share/*; do
				[ "${i}" = "./subsystems.d/${subsystem_name}/share/*" ] && break
				rm ${i##*/}
			done
		echo 'Unlinking to etc...'
			cd ./config
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
