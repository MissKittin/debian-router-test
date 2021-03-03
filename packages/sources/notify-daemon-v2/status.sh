#!/bin/sh
# notify-daemon-v2 package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='notify-daemon-v2'
conflict_check_file="$(readlink -f "$(readlink -f '/usr/local/etc/notify-daemon')/../..")"
conflict_package='notify-daemon'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# Check conflict
if [ "${conflict_check_file##*/}" = "${conflict_package}" ]; then
	echo "${conflict_package} package is installed"
	echo "which is in conflict with ${PACKAGE_NAME}"
else
	for file in \
		/usr/local/bin/notify-daemon.sh \
		/usr/local/etc/notify-daemon \
		/usr/local/etc/init.d/notify-daemon.sh \
		/usr/local/share/notify-daemon \
		/etc/init.d/notify-daemon.sh
	do
		echo -n "${file}"
			if [ -L "${file}" ] && [ -e "${file}" ]; then
				installed=true
				echo ' [ OK ]'
			else
				broken=true
				echo ' [Broken]'
			fi
	done
fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
