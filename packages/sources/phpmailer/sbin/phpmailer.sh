#!/bin/sh
# phpmailer - client side
# 03.09.2020

install_dir='/usr/local'

if [ "$1" = '--help' ] || [ "$3" = '' ]; then
	echo ''
	echo ' Usage:'
	echo 'mail_recipient_address mail_subject mail_message'
	echo ''
	[ "$3" = '' ] && exit 1
	exit 0
fi

. ${install_dir}/etc/phpmailer.rc

if result="$(wget -q -O- "${server}?user=${user}&password=${password}&recipient=${1}&subject=$(echo -n "${2}" | sed 's/ /+/g')&message=$(echo -n "${3}" | sed 's/ /+/g')")"; then
	echo "remote: ${result}"
	exit 0
else
	echo 'local/remote: failed'
	exit 2
fi
