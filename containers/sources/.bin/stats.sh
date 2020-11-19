#!/bin/sh
# Print containers ram usage

# Functions & home
containers_home="$(dirname "$(readlink -f "${0}/..")")"
parse_line()
{
	echo "$1\t$3\t$4\t$5"
}


# List started containers
echo -n 'Started containers: '
output="$(
	mount | grep "${containers_home}*" | grep '/.container type' | while read line; do
		[ -e "$(echo $line | awk '{print $3}')/.start.sh.pid" ] || echo $line | awk '{print $1}'
	done | xargs
)"
[ "$output" = '' ] && echo '(none)' || echo "$output"

# List booting containers
echo -n 'Booting containers: '
output="$(
	mount | grep "${containers_home}*" | grep '/.container type' | while read line; do
		[ -e "$(echo $line | awk '{print $3}')/.start.sh.pid" ] && echo $line | awk '{print $1}'
	done | xargs
)"
[ "$output" = '' ] && echo '(none)' || echo "$output"

# Print detailed memory usage
output="$(
	echo ''; echo 'Memory usage:'
	echo "Name\tUsed\tAvail\tUse%"
	df -h | grep "${containers_home}*" | grep '/.container' | grep -v '/mnt$' | while read line; do
		parse_line $line
	done
)"
[ "$output" = '' ] && echo '(none)' || echo "$output"

# Read disk usage
cd "$(dirname "$(readlink -f "${0}")")/.."
echo ''
echo 'Disk usage: '
du -shx */ 2>&1 | tr -d '/'

exit 0
