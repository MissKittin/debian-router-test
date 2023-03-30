#!/bin/sh
# bootstrap-installer-v2 package
# build script
do_chown='false'

PACKAGE_NAME='bootstrap-installer-v2'
[ "${BOOTSTRAP_INSTALLER_BUILD_CONFIG}" = '' ] && \
	BOOTSTRAP_INSTALLER_BUILD_CONFIG='debian/bootstrap-installer.rc_debian-desktop'

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

${do_chown} && chown root:root ./scripts
chmod 755 ./scripts
${do_chown} && chown root:root ./scripts/quick-format.sh
chmod 644 ./scripts/quick-format.sh
${do_chown} && chown root:root ./scripts/make-offline-preseed.sh
chmod 644 ./scripts/make-offline-preseed.sh
${do_chown} && chown root:root ./scripts/lenny-install-kernel.sh
chmod 644 ./scripts/lenny-install-kernel.sh

${do_chown} && chown root:root ./sbin
chmod 700 ./sbin
${do_chown} && chown root:root ./sbin/bootstrap-installer.sh
chmod 700 ./sbin/bootstrap-installer.sh

${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/debian
chmod 755 ./etc/debian
${do_chown} && chown root:root ./etc/debian/bootstrap-installer.rc_debian-router
chmod 644 ./etc/debian/bootstrap-installer.rc_debian-router
${do_chown} && chown root:root ./etc/debian/bootstrap-installer.rc_debian-desktop
chmod 644 ./etc/debian/bootstrap-installer.rc_debian-desktop
${do_chown} && chown root:root ./etc/debian/bootstrap-installer.rc_debian-server
chmod 644 ./etc/debian/bootstrap-installer.rc_debian-server
${do_chown} && chown root:root ./etc/bootstrap-installer-repos.rc
chmod 644 ./etc/bootstrap-installer-repos.rc
${do_chown} && chown root:root ./etc/ubuntu
chmod 755 ./etc/ubuntu
${do_chown} && chown root:root ./etc/ubuntu/bootstrap-installer.rc_ubuntu-desktop
chmod 644 ./etc/ubuntu/bootstrap-installer.rc_ubuntu-desktop
${do_chown} && chown root:root ./etc/ubuntu/bootstrap-installer.rc_ubuntu-server
chmod 644 ./etc/ubuntu/bootstrap-installer.rc_ubuntu-server

${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/bootstrap-installer
chmod 755 ./share/bootstrap-installer

${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d
chmod 755 ./share/bootstrap-installer/pre-chroot.d
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S01_config.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S01_config.rc
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S10_root-partition.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S10_root-partition.rc
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S01_a-libraries.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S01_a-libraries.rc
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S01_c-check-if-debian.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S01_c-check-if-debian.rc
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S50_bind.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S50_bind.rc
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S50_resolvconf.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S50_resolvconf.rc
${do_chown} && chown root:root ./share/bootstrap-installer/pre-chroot.d/S20_check-internet.rc
chmod 644 ./share/bootstrap-installer/pre-chroot.d/S20_check-internet.rc

${do_chown} && chown root:root ./share/bootstrap-installer/post-chroot.d
chmod 755 ./share/bootstrap-installer/post-chroot.d
${do_chown} && chown root:root ./share/bootstrap-installer/post-chroot.d/S20_resolvconf.rc
chmod 644 ./share/bootstrap-installer/post-chroot.d/S20_resolvconf.rc
${do_chown} && chown root:root ./share/bootstrap-installer/post-chroot.d/S60_unbind.rc
chmod 644 ./share/bootstrap-installer/post-chroot.d/S60_unbind.rc
${do_chown} && chown root:root ./share/bootstrap-installer/post-chroot.d/S99_uninstall-bootstrap-installer.rc
chmod 644 ./share/bootstrap-installer/post-chroot.d/S99_uninstall-bootstrap-installer.rc
${do_chown} && chown root:root ./share/bootstrap-installer/post-chroot.d/S90_sync.rc
chmod 644 ./share/bootstrap-installer/post-chroot.d/S90_sync.rc

${do_chown} && chown root:root ./share/bootstrap-installer/lib
chmod 755 ./share/bootstrap-installer/lib
${do_chown} && chown root:root ./share/bootstrap-installer/lib/I_print-message.rc
chmod 644 ./share/bootstrap-installer/lib/I_print-message.rc
${do_chown} && chown root:root ./share/bootstrap-installer/lib/I_reset-settings.rc
chmod 644 ./share/bootstrap-installer/lib/I_reset-settings.rc

${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d
chmod 755 ./share/bootstrap-installer/in-chroot.d
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S10_user-repos.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S10_user-repos.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_initramfs-tools-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_initramfs-tools-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S05_installer-config-dir.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S05_installer-config-dir.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S10_apt-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S10_apt-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_resolvconf-tweak.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_resolvconf-tweak.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_sysvinit-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_sysvinit-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_unattended-tzdata.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_unattended-tzdata.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_hosts.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_hosts.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_grub-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_grub-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_debconf-frontend.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_debconf-frontend.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_desktop-gdm-auto-login.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_desktop-gdm-auto-login.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S10_hostname.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S10_hostname.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_udev-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_udev-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S01_config.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S01_config.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S20_user-script.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S20_user-script.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_policykit-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_policykit-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_usermod.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_usermod.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S90_apt-unhold.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S90_apt-unhold.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S90_etc-tweaks-update-skel.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S90_etc-tweaks-update-skel.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S28_user-script.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S28_user-script.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S99_user-script.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S99_user-script.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S21_apt-mark.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S21_apt-mark.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S26_dpkg-reconfigure.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S26_dpkg-reconfigure.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S01_a-libraries.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S01_a-libraries.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_sudo-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_sudo-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_grub-install.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_grub-install.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_network-manager.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_network-manager.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_desktop-env-icewm.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_desktop-env-icewm.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_desktop-env-xterm.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_desktop-env-xterm.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S49_desktop-xserver-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S49_desktop-xserver-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S01_change-dir.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S01_change-dir.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S99_z-end.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S99_z-end.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_busybox-syslog.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_busybox-syslog.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_desktop-env-xfce.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_desktop-env-xfce.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_fstab-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_fstab-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S23_apt-main.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S23_apt-main.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S10_adduser.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S10_adduser.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S51_desktop-auto-startx.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S51_desktop-auto-startx.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_sudo-passwd.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_sudo-passwd.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S10_fstab.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S10_fstab.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_desktop-lightdm-auto-login.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_desktop-lightdm-auto-login.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_systemd-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_systemd-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_user-hushlogin.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_user-hushlogin.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_unattended-locales.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_unattended-locales.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_sysctl-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_sysctl-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_desktop-gtk3-nocsd.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_desktop-gtk3-nocsd.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_rclocal-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_rclocal-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S01_a-env-path.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S01_a-env-path.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_hwclock-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_hwclock-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S49_user-home-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S49_user-home-tweaks.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_qt5ct.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_qt5ct.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_xserver-legacy.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_xserver-legacy.rc
${do_chown} && chown root:root ./share/bootstrap-installer/in-chroot.d/S50_var-log-tweaks.rc
chmod 644 ./share/bootstrap-installer/in-chroot.d/S50_var-log-tweaks.rc

${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

ln -s "./${BOOTSTRAP_INSTALLER_BUILD_CONFIG}" ./etc/bootstrap-installer.rc

chmod 644 ./.build.sh
echo ''
exit 0
