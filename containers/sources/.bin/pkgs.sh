#!/bin/sh
# Find upgradable packages in overlay containers
# Reqiures ${DESTINATION}/.container/mnt/tmp/.debug.txt(.gz) created on container startup
# Usage: pkgs.sh [nocheck]

# No version check
version_check=true
[ "$1" = 'nocheck' ] && version_check=false

# Check root
if ! dpkg --version > /dev/null 2>&1 && $version_check; then
	echo 'No superuser'
	exit 1
fi

# Functions
print_S2()
{
	echo -n "$2"
}
print_version()
{
	if [ ! "$7" = '' ] && ! echo -n "$5" | grep Packages > /dev/null 2>&1; then # remove apt-get update log
		echo -n " $5 $7 "
		if $version_check; then
			apt-cache policy $5 | grep 'Candidate' | while read line; do
				dpkg --compare-versions $(print_S2 $line) gt $7 && echo '[upgradable]' || echo '[up to date]'
			done
		else
			echo ''
		fi
	fi
}

# Find overlay containers
cd $(dirname $0)/..
for i in *; do
	[ -e ./${i}/.container/.start.sh.pid ] || \
		if [ -e ./${i}/.container/mnt/tmp/.debug.txt ]; then
			echo ''; echo "${i}:"
			cat ./${i}/.container/mnt/tmp/.debug.txt | grep 'Get:' | while read line; do
				print_version $line
			done
		elif [ -e ./${i}/.container/mnt/tmp/.debug.txt.gz ]; then
			echo ''; echo "${i}:"
			zcat ./${i}/.container/mnt/tmp/.debug.txt | grep 'Get:' | while read line; do
				print_version $line
			done
		fi
done

echo ''

exit 0
