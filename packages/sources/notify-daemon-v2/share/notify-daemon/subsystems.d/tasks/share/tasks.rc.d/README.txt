Here are tasks execution algorithms.
Add your algorithms to etc/notify-daemon/tasks.rc.d
This directory needs to be linked to the ${share_dir}

-----------------------------------
--- Dev details                 ---
-----------------------------------

|${task}
|-import ${etc_dir}/tasks.rc.d/${task}.d/*
|-execute appropriate "check" function or "job" function
|-execute "send notify" function if "check function" returned 0 (critical_events.rc and events.rc only)
|-execute "do" function if "check function" returned 0 (critical_events.rc only)
