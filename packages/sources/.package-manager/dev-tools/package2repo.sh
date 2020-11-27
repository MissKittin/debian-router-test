#!/bin/sh

process_package()
{
	package_name="${1##*/}"

	if [ -e "${2}/${package_name}" ]; then
		echo "[rm] ${2}/${package_name}"
		rm -r -f "${2}/${package_name}"
	fi

	echo "[mkdir] ${2}/${package_name}"
		mkdir "${2}/${package_name}"
	echo "[cp] ${1}"
		cp -rfp "${1}" "${2}/${package_name}/${package_name}"
	echo "[cp] ${1}/VERSION.txt"
		cp "${1}/VERSION.txt" "${2}/${package_name}/${package_name}-version.txt"
	echo "[cp] ${1}/CHANGELOG.txt"
		cp "${1}/CHANGELOG.txt" "${2}/${package_name}/${package_name}-changelog.txt"
	echo "[cd] ${2}/${package_name}"
		pwd="$(pwd)"
		cd "${2}/${package_name}"
	echo "[run] ${package_name}/.build.sh"
		chmod 755 ${package_name}/.build.sh
		${package_name}/.build.sh
	echo "[tar] ${package_name}"
		tar cf ./${package_name}.tar ./${package_name}
	echo "[gzip] ./${package_name}.tar"
		gzip -9 "./${package_name}.tar"
	echo "[rm] ${package_name}"
		rm -r -f "./${package_name}"
	echo "[cd] ${pwd}"
		cd ${pwd}
}

if [ ! "$(whoami)" = 'root' ]; then
	echo 'Run as root'
	exit 1
fi

if [ "${2}" = '' ]; then
	echo 'package2repo.sh /path/to/packages/package-name /path/to/repo'
	echo 'package2repo.sh /path/to/packages /path/to/repo --all'
	exit 1
fi

if [ ! -e "${1}" ]; then
	echo "${1} not exists"
	exit 1
fi
if [ ! -e "${2}" ]; then
	echo "${2} not exists"
	exit 1
fi

if [ "${3}" = '--all' ]; then
	for package in ${1}/*; do
		[ "${package}" = "${1}/*" ] && break
		process_package "${package}" "${2}"
	done
else
	process_package "${1}" "${2}"
fi

exit 0
