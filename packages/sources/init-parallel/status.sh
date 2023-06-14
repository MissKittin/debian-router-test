#!/bin/sh
# init-parallel package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='init-parallel'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/rcdown.local.d
#echo -n '/usr/local/etc/rcdown.local.d/init-parallel-queue.rc'
#	if [ -L /usr/local/etc/rcdown.local.d/*_init-parallel-queue.rc ] && [ -e /usr/local/etc/rcdown.local.d/*_init-parallel-queue.rc ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

# /usr/local/etc
echo -n "/usr/local/etc/init-parallel"
	if [ -L /usr/local/etc/init-parallel ] && [ -e /usr/local/etc/init-parallel ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
for i in ainit-parallel ainit-parallel-single init-parallel-shutdown; do
	echo -n "/usr/local/etc/init.d/${i}"
		if [ -L /usr/local/etc/init.d/${i} ] && [ -e /usr/local/etc/init.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /usr/local/sbin
echo -n "/usr/local/sbin/init-parallel"
	if [ -L /usr/local/sbin/init-parallel ] && [ -e /usr/local/sbin/init-parallel ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi
echo -n "/usr/local/sbin/init-parallel-shutdown"
	if [ -L /usr/local/sbin/init-parallel-shutdown ] && [ -e /usr/local/sbin/init-parallel-shutdown ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/share
echo -n "/usr/local/share/init-parallel"
	if [ -L /usr/local/share/init-parallel ] && [ -e /usr/local/share/init-parallel ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
for i in ainit-parallel ainit-parallel-single init-parallel-shutdown; do
	echo -n "/etc/init.d/${i}"
		if [ -L /etc/init.d/${i} ] && [ -e /etc/init.d/${i} ]; then
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
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
