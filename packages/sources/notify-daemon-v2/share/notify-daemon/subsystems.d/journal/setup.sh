#!/bin/sh
subsystem_name='journal'
cd "$(dirname "$(readlink -f "${0}")")"

if [ ! -e '../sender' ]; then
	echo 'sender subsystem not installed'
	exit 1
fi

case $1 in
	'install')
		echo 'Enabling subsystem...'
			echo -n '' > ./.subsystem_enabled
		echo 'Installing sender method...'
			cd ../sender/share/sender.rc.d
			ln -s ../../../journal/sender.rc.d/journal.rc .
		echo 'Linking to share...'
			cd ../../../..
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
		echo 'Removing sender method...'
			rm ../sender/share/sender.rc.d/journal.rc
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
