#!/bin/sh
installed=false
broken=false
echo ''

for i in /usr/local/etc/ssh/sshd_config /etc/ssh/sshd_config; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done
echo -n '/etc/ssh/sshd_config.old'
	if [ -e /etc/ssh/sshd_config.old ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Tweak partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Tweak installed'
	exit 0
else
	echo ' Tweak not installed'
	exit 1
fi
