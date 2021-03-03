#!/bin/sh
subsystem_name='custom_settings'
cd "$(dirname "$(readlink -f "${0}")")"

case $1 in
	'install')
		echo 'Enabling subsystem...'
			echo -n '' > ./.subsystem_enabled
		echo 'Linking to etc...'
			[ -e '../../config/subsystems.d' ] || mkdir -p ../../config/subsystems.d
			cd ../../config/subsystems.d
			for i in ../../subsystems.d/${subsystem_name}/etc/subsystems.d/*; do
				[ "${i}" = "../../subsystems.d/${subsystem_name}/etc/subsystems.d/*" ] && break
				ln -s ${i} .
			done
	;;
	'uninstall')
		echo 'Disabling subsystem...'
			rm ./.subsystem_enabled
		echo 'Unlinking to etc...'
			cd ../../config/subsystems.d
			for i in ../../subsystems.d/${subsystem_name}/etc/subsystems.d/*; do
				[ "${i}" = "../../subsystems.d/${subsystem_name}/etc/subsystems.d/*" ] && break
				rm ${i##*/}
			done
	;;
	*)
		echo 'usage: install|uninstall'
	;;
esac

exit 0
