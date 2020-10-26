#!/bin/sh
# notify-daemon package
# build script
do_chown='false'

PACKAGE_NAME='notify-daemon'

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
${do_chown} && chown root:root ./extras/etc/notify-daemon
chmod 755 ./extras/etc/notify-daemon
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender.rc.d
chmod 755 ./extras/etc/notify-daemon/sender.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender.rc.d/mail.rc
chmod 644 ./extras/etc/notify-daemon/sender.rc.d/mail.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender-config.rc.d
chmod 755 ./extras/etc/notify-daemon/sender-config.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender-config.rc.d/mail.rc
chmod 644 ./extras/etc/notify-daemon/sender-config.rc.d/mail.rc
${do_chown} && chown root:root ./extras/bin
chmod 755 ./extras/bin
${do_chown} && chown root:root ./extras/bin/notify-send-mail.sh
chmod 755 ./extras/bin/notify-send-mail.sh
${do_chown} && chown root:root ./webadmin
chmod 755 ./webadmin
${do_chown} && chown root:root ./webadmin/home-plugins
chmod 755 ./webadmin/home-plugins
${do_chown} && chown root:root ./webadmin/home-plugins/x_notifications
chmod 755 ./webadmin/home-plugins/x_notifications
${do_chown} && chown root:root ./webadmin/home-plugins/x_notifications/notifications.php
chmod 644 ./webadmin/home-plugins/x_notifications/notifications.php
${do_chown} && chown root:root ./webadmin/home-plugins/x_notifications/index.php
chmod 644 ./webadmin/home-plugins/x_notifications/index.php
${do_chown} && chown root:root ./webadmin/home-plugins/x_notifications/shell.sh
chmod 755 ./webadmin/home-plugins/x_notifications/shell.sh
${do_chown} && chown root:root ./webadmin/sys-notifications
chmod 755 ./webadmin/sys-notifications
${do_chown} && chown root:root ./webadmin/sys-notifications/description.php
chmod 644 ./webadmin/sys-notifications/description.php
${do_chown} && chown root:root ./webadmin/sys-notifications/index.php
chmod 644 ./webadmin/sys-notifications/index.php
${do_chown} && chown root:root ./webadmin/sys-notifications/shell.sh
chmod 755 ./webadmin/sys-notifications/shell.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/notify-daemon
chmod 755 ./etc/notify-daemon
${do_chown} && chown root:root ./etc/notify-daemon/sender.rc.d
chmod 755 ./etc/notify-daemon/sender.rc.d
${do_chown} && chown root:root ./etc/notify-daemon/sender.rc.d/TEMPLATE
chmod 644 ./etc/notify-daemon/sender.rc.d/TEMPLATE
${do_chown} && chown root:root ./etc/notify-daemon/critical-events.rc.d
chmod 755 ./etc/notify-daemon/critical-events.rc.d
${do_chown} && chown root:root ./etc/notify-daemon/critical-events.rc.d/TEMPLATE
chmod 644 ./etc/notify-daemon/critical-events.rc.d/TEMPLATE
${do_chown} && chown root:root ./etc/notify-daemon/settings.rc
chmod 644 ./etc/notify-daemon/settings.rc
${do_chown} && chown root:root ./etc/notify-daemon/journal-manager.rc.d
chmod 755 ./etc/notify-daemon/journal-manager.rc.d
${do_chown} && chown root:root ./etc/notify-daemon/journal-manager.rc.d/TEMPLATE
chmod 644 ./etc/notify-daemon/journal-manager.rc.d/TEMPLATE
${do_chown} && chown root:root ./etc/notify-daemon/journal-manager.rc.d/simple.rc
chmod 644 ./etc/notify-daemon/journal-manager.rc.d/simple.rc
${do_chown} && chown root:root ./etc/notify-daemon/journal-manager.rc.d/console.rc
chmod 644 ./etc/notify-daemon/journal-manager.rc.d/console.rc
${do_chown} && chown root:root ./etc/notify-daemon/events.rc.d
chmod 755 ./etc/notify-daemon/events.rc.d
${do_chown} && chown root:root ./etc/notify-daemon/events.rc.d/TEMPLATE
chmod 644 ./etc/notify-daemon/events.rc.d/TEMPLATE
${do_chown} && chown root:root ./etc/notify-daemon/sender-config.rc.d
chmod 755 ./etc/notify-daemon/sender-config.rc.d
${do_chown} && chown root:root ./etc/notify-daemon/sender-config.rc.d/TEMPLATE
chmod 644 ./etc/notify-daemon/sender-config.rc.d/TEMPLATE
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_notify-daemon.rc
chmod 644 ./etc/rc.local.d/PKx_notify-daemon.rc
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/notify-daemon
chmod 755 ./share/notify-daemon
${do_chown} && chown root:root ./share/notify-daemon/sender.rc
chmod 644 ./share/notify-daemon/sender.rc
${do_chown} && chown root:root ./share/notify-daemon/critical-events.rc
chmod 644 ./share/notify-daemon/critical-events.rc
${do_chown} && chown root:root ./share/notify-daemon/sender.rc.d
chmod 755 ./share/notify-daemon/sender.rc.d
${do_chown} && chown root:root ./share/notify-daemon/sender.rc.d/journal.rc
chmod 644 ./share/notify-daemon/sender.rc.d/journal.rc
${do_chown} && chown root:root ./share/notify-daemon/libtimestamp.rc
chmod 644 ./share/notify-daemon/libtimestamp.rc
${do_chown} && chown root:root ./share/notify-daemon/journal-manager.rc
chmod 644 ./share/notify-daemon/journal-manager.rc
${do_chown} && chown root:root ./share/notify-daemon/events.rc
chmod 644 ./share/notify-daemon/events.rc
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/notify-daemon.sh
chmod 755 ./sbin/notify-daemon.sh
${do_chown} && chown root:root ./sbin/notify-daemon-state.sh
chmod 750 ./sbin/notify-daemon-state.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

chmod 644 ./.build.sh
echo ''
exit 0
