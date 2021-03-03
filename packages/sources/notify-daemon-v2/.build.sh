#!/bin/sh
# webadmin package
# build script
do_chown='false'
build_subsystems='true'

PACKAGE_NAME='notify-daemon-v2'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "${1}" = '--force' ]; then
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
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/notify-daemon.sh
chmod 755 ./etc/init.d/notify-daemon.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/notify-daemon
chmod 755 ./share/notify-daemon
${do_chown} && chown root:root ./share/notify-daemon/extensions.d
chmod 755 ./share/notify-daemon/extensions.d
${do_chown} && chown root:root ./share/notify-daemon/extensions.d/libtimestamp.rc
chmod 644 ./share/notify-daemon/extensions.d/libtimestamp.rc
${do_chown} && chown root:root ./share/notify-daemon/README.txt
chmod 644 ./share/notify-daemon/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d
chmod 755 ./share/notify-daemon/subsystems.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings
chmod 755 ./share/notify-daemon/subsystems.d/custom_settings
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/custom_settings/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/etc
chmod 755 ./share/notify-daemon/subsystems.d/custom_settings/etc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/etc/subsystems.d
chmod 755 ./share/notify-daemon/subsystems.d/custom_settings/etc/subsystems.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/etc/subsystems.d/custom_settings.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/custom_settings/etc/subsystems.d/custom_settings.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/etc/subsystems.d/custom_settings.rc.d/libtimestamp.rc
chmod 644 ./share/notify-daemon/subsystems.d/custom_settings/etc/subsystems.d/custom_settings.rc.d/libtimestamp.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/custom_settings/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/custom_settings/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/custom_settings/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-syslog
chmod 755 ./share/notify-daemon/subsystems.d/log-syslog
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-syslog/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/log-syslog/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-syslog/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/log-syslog/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-syslog/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/log-syslog/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext
chmod 755 ./share/notify-daemon/subsystems.d/log-plaintext
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc.d/log.rc
chmod 644 ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc.d/log.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc.d/default_settings.rc
chmod 644 ./share/notify-daemon/subsystems.d/log-plaintext/subsystem.rc.d/default_settings.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/log-plaintext/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/log-plaintext/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/log-plaintext/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/eol_extensions.d
chmod 755 ./share/notify-daemon/subsystems.d/log-plaintext/eol_extensions.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/log-plaintext/eol_extensions.d/99_log-plaintext.rc
chmod 644 ./share/notify-daemon/subsystems.d/log-plaintext/eol_extensions.d/99_log-plaintext.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol
chmod 755 ./share/notify-daemon/subsystems.d/eol
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/eol/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/core_extensions.d
chmod 755 ./share/notify-daemon/subsystems.d/eol/core_extensions.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/core_extensions.d/99_eol.rc
chmod 644 ./share/notify-daemon/subsystems.d/eol/core_extensions.d/99_eol.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/subsystem.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/eol/subsystem.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/subsystem.rc.d/default_settings.rc
chmod 644 ./share/notify-daemon/subsystems.d/eol/subsystem.rc.d/default_settings.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/eol/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/extensions.d
chmod 755 ./share/notify-daemon/subsystems.d/eol/extensions.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/extensions.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/eol/extensions.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/eol/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/eol/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/eol/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.tools
chmod 755 ./share/notify-daemon/subsystems.d/.tools
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.tools/check-dependencies.sh
chmod 755 ./share/notify-daemon/subsystems.d/.tools/check-dependencies.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.tools/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/.tools/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.tools/setup-all.sh
chmod 755 ./share/notify-daemon/subsystems.d/.tools/setup-all.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/core_extensions.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1/core_extensions.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/core_extensions.d/01_tasks-v1.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/core_extensions.d/01_tasks-v1.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc.d/events.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc.d/events.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc.d/critical-events.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/subsystem.rc.d/critical-events.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/etc
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1/etc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/etc/events.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1/etc/events.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/etc/events.rc.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/etc/events.rc.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/etc/critical-events.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1/etc/critical-events.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/etc/critical-events.rc.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/etc/critical-events.rc.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks-v1/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks-v1/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/tasks-v1/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal
chmod 755 ./share/notify-daemon/subsystems.d/journal
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/sender.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/journal/sender.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/sender.rc.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/journal/sender.rc.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/sender.rc.d/journal.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/sender.rc.d/journal.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/check_workspace.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/check_workspace.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/parse.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/parse.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/del.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/del.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/check_log.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/check_log.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/log.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/log.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/workspace.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/workspace.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/add.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/add.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/default_settings.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/subsystem.rc.d/default_settings.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/etc
chmod 755 ./share/notify-daemon/subsystems.d/journal/etc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/etc/journal.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/journal/etc/journal.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/etc/journal.rc.d/TEMPLATE
chmod 644 ./share/notify-daemon/subsystems.d/journal/etc/journal.rc.d/TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/journal/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/share
chmod 755 ./share/notify-daemon/subsystems.d/journal/share
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d/console.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d/console.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d/simple.rc
chmod 644 ./share/notify-daemon/subsystems.d/journal/share/journal.rc.d/simple.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/journal/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/journal/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/journal/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core
chmod 755 ./share/notify-daemon/subsystems.d/core
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/core/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/subsystem.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/core/subsystem.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/subsystem.rc.d/import.rc
chmod 644 ./share/notify-daemon/subsystems.d/core/subsystem.rc.d/import.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/subsystem.rc.d/default_settings.rc
chmod 644 ./share/notify-daemon/subsystems.d/core/subsystem.rc.d/default_settings.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/core/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/extensions.d
chmod 755 ./share/notify-daemon/subsystems.d/core/extensions.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/extensions.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/core/extensions.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/core/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/core/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/core/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks
chmod 755 ./share/notify-daemon/subsystems.d/tasks
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/core_extensions.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks/core_extensions.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/core_extensions.d/01_tasks.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks/core_extensions.d/01_tasks.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc
chmod 755 ./share/notify-daemon/subsystems.d/tasks/etc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/events.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/events.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/events.rc.d/TEMPLATE
chmod 644 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/events.rc.d/TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/critical-events.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/critical-events.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/critical-events.rc.d/TEMPLATE
chmod 644 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/critical-events.rc.d/TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/jobs.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/jobs.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/jobs.rc.d/TEMPLATE
chmod 644 ./share/notify-daemon/subsystems.d/tasks/etc/tasks.rc.d/jobs.rc.d/TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/share
chmod 755 ./share/notify-daemon/subsystems.d/tasks/share
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/events.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/events.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/jobs.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/jobs.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/critical-events.rc
chmod 644 ./share/notify-daemon/subsystems.d/tasks/share/tasks.rc.d/critical-events.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/tasks/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/tasks/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/tasks/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE
chmod 755 ./share/notify-daemon/subsystems.d/.TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/.TEMPLATE/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE/subsystem.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/.TEMPLATE/subsystem.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE/subsystem.rc.d/default_settings.rc
chmod 644 ./share/notify-daemon/subsystems.d/.TEMPLATE/subsystem.rc.d/default_settings.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/.TEMPLATE/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/.TEMPLATE/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/.TEMPLATE/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/.TEMPLATE/setup.sh
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender
chmod 755 ./share/notify-daemon/subsystems.d/sender
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/subsystem.rc
chmod 644 ./share/notify-daemon/subsystems.d/sender/subsystem.rc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/etc
chmod 755 ./share/notify-daemon/subsystems.d/sender/etc
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.d/TEMPLATE
chmod 644 ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.d/TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.cfg.d
chmod 755 ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.cfg.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.cfg.d/TEMPLATE
chmod 644 ./share/notify-daemon/subsystems.d/sender/etc/sender.rc.cfg.d/TEMPLATE
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/DEPENDENCIES.txt
chmod 644 ./share/notify-daemon/subsystems.d/sender/DEPENDENCIES.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/share
chmod 755 ./share/notify-daemon/subsystems.d/sender/share
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/share/sender.rc.d
chmod 755 ./share/notify-daemon/subsystems.d/sender/share/sender.rc.d
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/share/sender.rc.d/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/sender/share/sender.rc.d/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/README.txt
chmod 644 ./share/notify-daemon/subsystems.d/sender/README.txt
${do_chown} && chown root:root ./share/notify-daemon/subsystems.d/sender/setup.sh
chmod 755 ./share/notify-daemon/subsystems.d/sender/setup.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./bin
chmod 755 ./bin
${do_chown} && chown root:root ./bin/notify-daemon.sh
chmod 755 ./bin/notify-daemon.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

ln -s ../share/notify-daemon/config ./etc/notify-daemon
echo -n '' > ./share/notify-daemon/subsystems.d/log-syslog/setup_subsystem-provides-log
echo -n '' > ./share/notify-daemon/subsystems.d/log-plaintext/setup_subsystem-provides-log
#echo -n '' > ./share/notify-daemon/subsystems.d/tasks-v1/.no-auto-setup

echo ''
echo 'Checking subsystems dependencies...'
if ./share/notify-daemon/subsystems.d/.tools/check-dependencies.sh; then
	echo ''
	echo 'Installing subsystems...'
	./share/notify-daemon/subsystems.d/.tools/setup-all.sh install
	chmod 644 './share/notify-daemon/subsystems.d/.tools/setup-all.sh'
else
	echo ''
	echo 'There is a problem with dependencies'
	echo 'Resolve problems, chmod 755 .build.sh and run .build.sh again'
	echo 'Maybe you have a broken package?'
fi
echo ''

chmod 644 ./.build.sh
exit 0
