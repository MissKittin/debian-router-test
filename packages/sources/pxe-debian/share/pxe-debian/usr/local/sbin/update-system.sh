#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
LOG='/run/pxe-debian/update-system.log'
apt_cache_indicators='/run/pxe-debian'

echo 'Start' > $LOG

if [ "$1" = 'no-apt-update' ]; then
	echo '' >> $LOG; echo 'update disabled by parameter' >> $LOG
else
	PING_HOST='http://ftp.debian.org/'
	while ! busybox wget -q --tries=10 --spider $PING_HOST; do
		# Keep calm
		echo 'No internet' >> $LOG
		if busybox ping -c 1 8.8.8.8 > /dev/null 2>&1; then
			echo 'Second ping success' >> $LOG
			break
		fi
		sleep 10
	done

	echo '' >> $LOG; echo 'update' >> $LOG
	apt-get update >> $LOG 2>&1
fi

echo '' >> $LOG; echo 'dist-upgrade' >> $LOG
while ! apt-get dist-upgrade -y >> $LOG 2>&1; do
	echo '' >> $LOG; echo 'dist-upgrade failed, retrying...' >> $LOG
	sleep 1
done

echo '' >> $LOG; echo 'autoremove' >> $LOG
while ! apt-get autoremove --purge -y >> $LOG 2>&1; do
	echo '' >> $LOG; echo 'autoremove failed, retrying...' >> $LOG
	sleep 1
done

if [ -e ${apt_cache_indicators}/.apt_cache-enabled ]; then
	echo '' >> $LOG; echo 'clean disabled by apt_cache' >> $LOG
else
	echo '' >> $LOG; echo 'clean' >> $LOG
	while ! apt-get clean >> $LOG 2>&1; do
		echo '' >> $LOG; echo 'clean failed, retrying...' >> $LOG
		sleep 1
	done
fi

if [ -e ${apt_cache_indicators}/.apt_cache-enabled ]; then
	echo '' >> $LOG; echo 'remove-lists disabled by apt_cache' >> $LOG
else
	echo '' >> $LOG; echo 'remove-lists' >> $LOG
	for i in /var/lib/apt/lists/*; do
		[ "$i" = '/var/lib/apt/lists/*' ] && break
		[ ! "$i" = '/var/lib/apt/lists/auxfiles' ] && [ ! "$i" = '/var/lib/apt/lists/lock' ] && [ ! "$i" = '/var/lib/apt/lists/partial' ] && rm $i  >> $LOG 2>&1
	done
fi

echo '' >> $LOG; echo 'rc0.d rc6.d correction' >> $LOG
[ -e /etc/rc0.d/K01halt ] && mv /etc/rc0.d/K01halt /etc/rc0.d/K99halt && echo 'rc0.d corrected' >> $LOG
[ -e /etc/rc6.d/K01reboot ] && mv /etc/rc6.d/K01reboot /etc/rc6.d/K99reboot && echo 'rc6.d corrected' >> $LOG

echo '' >> $LOG; echo 'Gzip, Exit' >> $LOG
[ -e "${LOG}.gz" ] && rm ${LOG}.gz
gzip -9 $LOG

exit 0
