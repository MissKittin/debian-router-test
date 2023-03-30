#!/bin/sh

if [ "${1}" = 'second-phase' ]; then
	. '/bootstrap-installer.rc'

	_apt_force_yes='--force-yes'
	if [ "$(sed 's/\..*//' /etc/debian_version)" -ge '11' ]; then
		_apt_force_yes='--allow-unauthenticated --allow-downgrades --allow-remove-essential'
	fi

	if echo -n "${apt_install_packages}" | grep 'grub-pc\|grub-efi' > /dev/null 2>&1; then
		echo -n "${apt_install_packages}" | grep 'grub-pc' > /dev/null 2>&1 && apt_install_packages="${apt_install_packages} grub-efi" || apt_install_packages="${apt_install_packages} grub-pc"
	fi

	apt-get update

	apt-get dist-upgrade --download-only -y ${_apt_force_yes}

	for package in ${apt_install_packages}; do
		apt-get install --download-only --ignore-missing -y ${_apt_force_yes} ${apt_custom_options} ${package} ${apt_mark_temporary_hold}
	done

	tar cf '/bootstrap-installer-preseed.tar' '/var/cache/apt/archives' '/var/lib/apt/lists' '/var/lib/apt/mirrors' > /dev/null 2>&1
	gzip -9 '/bootstrap-installer-preseed.tar'

	apt-get clean

	exit 0
fi

if [ ! "$(whoami)" = 'root' ]; then
	echo 'I am not root'
	exit 1
fi

if [ "${2}" = '' ] || [ "${1}" = '-h' ] || [ "${1}" = '--help' ]; then
	echo "${0##*/} path-to-bootstrap ./path-to-bootstrap-installer-config-file"
	exit 1
fi

if [ ! -f "${2}" ]; then
	echo "config file ${2} not exists"
	exit 1
fi

if [ ! -f "${1}/etc/debian_version" ]; then
	echo "${1} is not debian"
	exit 1
fi

if [ ! -e '/etc/resolv.conf' ]; then
	echo 'host os does not have /etc/resolv.conf'
	exit 1
fi

if [ -e "$(dirname ${1})/bootstrap-installer-preseed.tar.gz" ]; then
	echo "$(dirname ${1})/bootstrap-installer-preseed.tar.gz exists"
	exit 1
fi

if ! . "${2}"; then
	echo 'config file is invalid'
	exit 1
fi

cat '/etc/resolv.conf' > "${1}/etc/resolv.conf"
cp -p "${0}" "${1}/make-offline-preseed.sh"
cp "${2}" "${1}/bootstrap-installer.rc"

chroot "${1}" '/make-offline-preseed.sh' 'second-phase'

rm "${1}/bootstrap-installer.rc"
rm "${1}/make-offline-preseed.sh"
rm "${1}/etc/resolv.conf"

mv "${1}/bootstrap-installer-preseed.tar.gz" "$(dirname ${1})"

exit 0
