#!/bin/sh
do_chown='false'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

echo 'Building...'
cd "$(dirname "$(readlink -f "${0}")")"

${do_chown} && chown root:root .
chmod 755 .
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/sudoers.d
chmod 755 ./etc/sudoers.d
${do_chown} && chown root:root ./etc/sudoers.d/nodns
chmod 640 ./etc/sudoers.d/nodns
${do_chown} && chown root:root ./etc/sudoers.d/nolecture
chmod 640 ./etc/sudoers.d/nolecture
${do_chown} && chown root:root ./remove.sh
chmod 755 ./remove.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./apply.sh
chmod 755 ./apply.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
