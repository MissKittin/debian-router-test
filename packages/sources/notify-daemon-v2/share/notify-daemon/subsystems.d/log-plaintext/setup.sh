#!/bin/sh
subsystem_name='log-plaintext'
cd "$(dirname "$(readlink -f "${0}")")"

case $1 in
	'install')
		if [ ! -L '../log' ]; then
			echo 'Enabling subsystem...'
				echo -n '' > ./.subsystem_enabled
				cd ..
			echo "Setting ${subsystem_name} as default log subsystem..."
				rm log > /dev/null 2>&1
				ln -s log-plaintext log
			echo 'Installing eol extension...'
				cd ./eol/extensions.d
				ln -s ../../log-plaintext/eol_extensions.d/99_log-plaintext.rc .
		else
			echo '"log" symlink exists - not installed'
		fi
	;;
	'uninstall')
		echo 'Disabling subsystem...'
			rm ./.subsystem_enabled
		echo 'Uninstalling eol extension...'
			rm ../eol/extensions.d/99_log-plaintext.rc
	;;
	*)
		echo 'usage: install|uninstall'
	;;
esac

exit 0
