# Notify daemon v2
The second version of the notify-daemon.  
v1 does its job well, but it's hard to add new features.  
That's why a second, modular version of notify-daemon was created.  
For more info, see `share/notify-daemon/README.txt`.

### Warning
**Conflicts with notify-daemon v1**  

### Subsystems
Each subsystem has `README.txt`
* **Core** (critical)
* **Custom settings**
* **EOL**
* **Journal** (critical)
* **Log plaintext** (critical)
* **Log syslog** (optional, replaces Log plaintext)
* **Sender** (critical)
* **Tasks**
* **Tasks-v1** (compatibility with notify daemon v1)

### Extensions
* **libtimestamp** adds timestamp support to execute job every `n` seconds instead of every loop
