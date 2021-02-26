#!/bin/dash
# Command stack: dash, sensors, tail, head

# Import PATH variable
. ./lib/shell/path.rc

case $1 in
	'sensors')
		sensors
	;;
esac

exit 0
