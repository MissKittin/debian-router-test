#!/bin/sh
installed=false
broken=false
echo ''

for i in /etc/php/7.0/cli/conf.d/98-opcache.ini /etc/php/7.0/cli/conf.d/99-security.ini /usr/local/etc/php/7.0-cli-conf.d/98-opcache.ini /usr/local/etc/php/7.0-cli-conf.d/99-security.ini; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

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
