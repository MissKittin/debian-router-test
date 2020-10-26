# busybox-syslogd
Simple init script for `busybox syslogd`.  
Run `busybox-syslogd zip` to compress log after `busybox-syslogd stop`.

### Configuration
Edit LOG path in `etc/init.d/busybox-syslogd` section.

### Warning
This package is made for `syslog` container for saving logs before running the container and should be stopped after `syslog` is started.  
If you want to use this package, do not install `busybox-syslogd` package from debian repo.
