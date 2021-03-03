#!/bin/sh
subsystem_name='log-syslog'
cd "$(dirname "$(readlink -f "${0}")")"

case $1 in
	'install')
		if [ ! -L '../log' ]; then
			echo 'Enabling subsystem...'
				echo -n '' > ./.subsystem_enabled
				cd ..
			echo "Setting ${subsystem_name} as default log subsystem..."
				rm log > /dev/null 2>&1
				ln -s log-syslog log
		else
			echo '"log" symlink exists - not installed'
		fi
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
