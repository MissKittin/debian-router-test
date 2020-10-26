#!/bin/sh
do_chown='false'

for i in .bin .webadmin .webadmin/sys-containers; do
	${do_chown} && chown root:root ${i}
	chmod 755 ${i}
done

for i in .webadmin/sys-containers/description.php .webadmin/sys-containers/index.php; do
	${do_chown} && chown root:root ${i}
	chmod 644 ${i}
done

for i in .bin/pkgs.sh .bin/stats.sh .webadmin/sys-containers/shell.sh .webadmin/install.sh .webadmin/uninstall.sh; do
	${do_chown} && chown root:root ${i}
	chmod 755 ${i}
done

chmod 644 .chown.sh
exit 0
