notify-daemon v1 events compatibility subsystem.
It's best if you turn it off if you not using v1 events.

-----------------------------------
--- Dev details                 ---
-----------------------------------

|${task}
|-import ${etc_dir}/${task}.d/*
|-execute appropriate "check" function
|-execute "send notify" function if "check function" returned 0
|-execute "do" function if "check function" returned 0 (critical_events.rc only)
