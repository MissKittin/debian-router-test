The last mile of the notify-daemon execution path.
This modules runs all defined tasks that send notifications and perform actions.

This module is an extension for the core subsystem.

-----------------------------------
--- Dev details                 ---
-----------------------------------

|subsystem.rc
|-import ${share_dir}/tasks.rc.d/*.rc
|-for task in TASKS_LIST
