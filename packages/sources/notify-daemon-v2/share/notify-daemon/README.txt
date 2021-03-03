This is the heart of the notify-daemon.

notify-daemon.sh imports all subsystems and executes subsystem__core after all subsystems are imported.
The daemon code is in the core subsystem, which calls the other subsystems defined in core/extensions.d

To configure a subsystem, copy subsystems.d/${SUBSYSTEM_NAME}/subsystem.rc.d/default_settings.rc
to config/subsystem.rc.d/${SUBSYSTEM_NAME}.rc and edit.

config dir (created automatically) must be linked to etc/notify-daemon

-----------------------------------
--- Dev details                 ---
-----------------------------------

|notify-daemon.sh
|-import ${share_dir}/subsystems.d/*/subsystem.rc
|-for subsystem in ${SUBSYSTEMS_LIST}
