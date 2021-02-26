# acpid-mods
Power management tweaks for servers.


## acpid-autosuspend
Simple daemon, that checks OS environment and networking and suspend PC if no defined exception has occurred.  
Define exceptions in `etc/acpid-autosuspend/checklist` and configure daemon in `etc/acpid-suspend/config.rc`.  
You can add exceptions variables to this file.

#### Operating mode
`continuous_mode` -> ignores (de)activate_at_hour/min (e.g. file archives)

#### Oneshot configuration
Write `activate_at_hour`, `activate_at_min`, `deactivate_at_hour`, `deactivate_at_min` values to the `oneshot_file`.  
Change owner to `oneshot_file_owner` and mode to `oneshot_file_mode`.  
`oneshot_file` will be imported and defined time values will be used. The file will be removed after resume.


## acpid-choice
Take action by pressing the power button several times.  
Define actions in `etc/acpid-choice.rc`.  
**This script requires acpid.**


## acpid-suspend
Prepare OS for sleep, setup rtcwake clock and re-setup OS after resume.  
Define actions in `etc/acpid-suspend/pre-suspend.d` and `etc/acpid-suspend/post-suspend.d`.

#### Configuration
Edit `etc/acpid-suspend/config.rc`, configuration does not need to be explained.


## Extras
Webadmin power management modules for acpid-autosuspend and acpid-suspend.

## Deprecated files
* etc/rc.local.d/PKx_acpid-autosuspend.rc
* sbin/acpid-choice.sh.old
* sbin/acpid-autosuspend.sh.old
