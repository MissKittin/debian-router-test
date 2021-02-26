#!/bin/sh
### Power button script injection for acpid
### /etc/acpi/powerbtn.sh
### 25.01.2019, 06.02.2019, 10.01.2021

# acpid two-click patch (ignore button releasing)
if [ -e '/var/run/.powerbtn_acpid-patch' ]; then
	rm '/var/run/.powerbtn_acpid-patch'
	exit '0'
fi
touch '/var/run/.powerbtn_acpid-patch'

# delegate action to acpid-choice
'/usr/local/sbin/acpid-choice.sh' &

exit '0'
