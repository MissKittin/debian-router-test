# notify-daemon
Checks the OS and creates notifications when a defined exception occurs (and possibly takes action).  
The program was created mainly to deliver a list of notifications to the webadmin's dashboard.

### Configuration
* `settings.rc` -> basic settings
* `critical-events.rc.d` -> events in which appropriate action is required
* `events.rc.d` -> events that triggers notify sending only
* `journal-manager.rc.d` -> notify list parsers
* `sender.rc.d` -> scripts handling the passing of notifications
* `sender-config.rc.d` -> configurations of those above

### Creating events
Copy `TEMPLATE` to `yourevent.rc.disabled` and edit.  
After editing rename `yourevent.rc.disabled` to `yourevent.rc`.

### Libraries
* `libtimestamp.rc` -> pauses checking for x seconds

### Extras
* `notify-send-mail.sh` -> send mail with notification via shared hosting  
Upload PHP code from the bottom of `notify-send-mail.sh` to your shared hosting.
* Webadmin module and dashboard plugin

### More info
See comment in `sbin/notify-daemon.sh` after `exit 0`.
