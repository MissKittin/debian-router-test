#!/bin/sh
# Find upgradable debian packages in overlay containers
# Reqiures ${DESTINATION}/.container/mnt/.debug.txt(.gz) created on container startup
#  and dpkg in host system
# Usage: check-overlay-pkgs.sh [nocheck]

# No version check
version_check=true
[ "$1" = 'nocheck' ] && version_check=false

# Check root
if ! dpkg --version > /dev/null 2>&1 && $version_check; then
	echo 'No superuser/no debian'
	exit 1
fi

# Functions
print_S2() { echo -n "${2}"; }
#print_version_a()
#{
#	if [ ! "$7" = '' ] && ! echo -n "$5" | grep Packages > /dev/null 2>&1; then # remove apt-get update log
#		echo -n " $5 $7 "
#		if $version_check; then
#			apt-cache policy $5 | grep 'Candidate' | while read line; do
#				dpkg --compare-versions $(print_S2 $line) gt $7 && echo '[upgradable]' || echo '[up to date]'
#			done
#		else
#			echo ''
#		fi
#	fi
#}
print_version_b()
{
	local package="${2}"
	local version="$(echo -n "${3}" | tr -d '(' | tr -d ')')"
	local line
	echo -n " ${package} ${version} "
	if "${version_check}"; then
		apt-cache policy "${package}" | grep 'Candidate' | while read line; do
			dpkg --compare-versions "$(print_S2 ${line})" gt "${version}" && echo '[upgradable]' || echo '[up to date]'
		done
	fi
}

# Find overlay containers
cd $(dirname $0)/..
for i in *; do
	if [ ! -e ./${i}/.container/.start.sh.pid ] && [ -e "./${i}/.container/mnt/etc/debian_version" ]; then
		if [ -e ./${i}/.container/mnt/.debug.txt.gz ]; then
			echo ''; echo "${i}:"
			#zcat ./${i}/.container/mnt/.debug.txt.gz | grep 'Get:' | while read line; do
			#	print_version_a $line
			#done
			zcat ./${i}/.container/mnt/.debug.txt.gz | grep 'Unpacking ' | while read line; do
				print_version_b $line
			done
		elif [ -e ./${i}/.container/mnt/.debug.txt ]; then
			echo ''; echo "${i}:"
			#cat ./${i}/.container/mnt/.debug.txt | grep 'Get:' | while read line; do
			#	print_version_a $line
			#done
			cat ./${i}/.container/mnt/.debug.txt | grep 'Unpacking ' | while read line; do
				print_version_b $line
			done
		fi
	fi
done

echo ''
exit 0
