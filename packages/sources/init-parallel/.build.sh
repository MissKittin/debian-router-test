#!/bin/sh
# init-parallel package
# build script
do_chown='false'

PACKAGE_NAME='init-parallel'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi

echo ''
echo 'Building...'
cd "$(dirname "$(readlink -f "${0}")")"

${do_chown} && chown root:root .
chmod 755 .
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/rc.local.d
chmod 755 ./extras/etc/rc.local.d
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_compress-init-parallel.rc
chmod 644 ./extras/etc/rc.local.d/PKx_compress-init-parallel.rc
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/init-parallel
chmod 755 ./etc/init-parallel
${do_chown} && chown root:root ./etc/init-parallel/config.rc
chmod 644 ./etc/init-parallel/config.rc
${do_chown} && chown root:root ./etc/init-parallel/TEMPLATE
chmod 644 ./etc/init-parallel/TEMPLATE
${do_chown} && chown root:root ./etc/init-parallel/README
chmod 644 ./etc/init-parallel/README
${do_chown} && chown root:root ./etc/rcdown.local.d
chmod 755 ./etc/rcdown.local.d
${do_chown} && chown root:root ./etc/rcdown.local.d/Sx_init-parallel-queue.rc
chmod 644 ./etc/rcdown.local.d/Sx_init-parallel-queue.rc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/ainit-parallel
chmod 755 ./etc/init.d/ainit-parallel
${do_chown} && chown root:root ./etc/init.d/init-parallel-shutdown
chmod 755 ./etc/init.d/init-parallel-shutdown
${do_chown} && chown root:root ./etc/init.d/ainit-parallel-single
chmod 755 ./etc/init.d/ainit-parallel-single
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/init-parallel
chmod 755 ./share/init-parallel
${do_chown} && chown root:root ./share/init-parallel/required_start.rc
chmod 644 ./share/init-parallel/required_start.rc
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/init-parallel
chmod 750 ./sbin/init-parallel
${do_chown} && chown root:root ./sbin/init-parallel-shutdown
chmod 750 ./sbin/init-parallel-shutdown
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

mkdir ./etc/init-parallel/rc0.d
mkdir ./etc/init-parallel/rc2.d
mkdir ./etc/init-parallel/rcS.d
ln -s rc0.d ./etc/init-parallel/rc6.d

chmod 644 ./.build.sh
echo ''
exit 0
