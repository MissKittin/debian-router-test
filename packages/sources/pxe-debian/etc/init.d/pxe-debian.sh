#!/bin/sh
### BEGIN INIT INFO
# Provides:          pxe-debian
# Required-Start:
# Required-Stop:
# Should-Start:      glibc
# Default-Start:     S
# Default-Stop:
# Short-Description: Install pxe-debian package
# Description:       Setup rootfs customizations
### END INIT INFO

PATH=/sbin:/bin
. /lib/lsb/init-functions
install_dir='/usr/local/share/pxe-debian'

pxe_debian()
{
	local dir
	local file
	local link

	local pwd="$(pwd)"
	cd "${install_dir}"

	find * -type d | while read dir; do
		[ ! -e "/${dir}" ] && mkdir "/${dir}"
		chmod $(stat -c '%a' "./${dir}") "/${dir}"
		chown $(stat -c '%g:%u' "./${dir}") "/${dir}"
	done
	find * -type f | while read file; do
		[ -e "/${file}" ] && rm "/${file}"
		ln -s "${install_dir}/${file}" "/${file}"
	done
	find * -type l | while read link; do
		[ -e "/${link}" ] && rm "/${link}"
		ln -s "${install_dir}/${link}" "/${link}"
	done

	cd "${pwd}"
}

cmdline_modules()
{
	###########################################
	### Parameters:                         ###
	### forcemodule=forcemodulename         ###
	### forcemodulename.parameter=value     ###
	### blacklistmodule=blacklistmodulename ###
	###########################################

	mountpoint -q /proc || mount -t proc proc /proc

	local x
	for x in $(cat /proc/cmdline); do
		case ${x} in
			forcemodule=*)
				forcemodule="${x#forcemodule=}"
				echo "${forcemodule}" >> /etc/modules
			;;
			blacklistmodule=*)
				blacklistmodule="${x#blacklistmodule=}"
				echo "blacklist ${blacklistmodule}" >> /etc/modprobe.d/pxe-debian.conf
			;;
		esac
	done
}

apply_tweaks()
{
	chmod 750 /usr/sbin
	chmod 750 /usr/local/sbin

	rm /etc/rcS.d/S00pxe-debian.sh
	rm /etc/init.d/pxe-debian.sh
	rm /usr/local/etc/init.d/pxe-debian.sh
	rmdir /usr/local/etc/init.d > /dev/null 2>&1
}

case ${1} in
	'start')
		log_daemon_msg 'Installing package' pxe-debian
		pxe_debian
		log_end_msg 0

		log_action_msg_pre; echo 'Building modules lists...'
		cmdline_modules

		log_action_msg_pre; echo 'Applying tweaks...'
		apply_tweaks
	;;
	*)
		echo 'DO NOT USE THIS!'
		exit 1
	;;
esac

exit 0
