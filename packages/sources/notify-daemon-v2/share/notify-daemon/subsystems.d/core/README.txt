This is the core of the notify-daemon.
Delegates all work to the other modules.
Configure this subsystem in the extensions.d folder.

-----------------------------------
--- Dev details                 ---
-----------------------------------

|subsystem.rc
|-import subsystem.rc.d/default_settings.rc
|-import ${etc_dir}/subsystems.d/core.rc (optionally)
|-import extensions.d/*
