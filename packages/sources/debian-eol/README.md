# debian-eol
Simple PHP script that downloads `Production Releases` data from https://wiki.debian.org/DebianReleases and outputs data in console.  
This script can also check your OS version EOL/LTS EOL:  
`debian-eol.php --check $(cat /etc/debian_version)`  
and returns 0 if supported, 1 - LTS supported, 2 - not supported, 3 - wrong input data.

### Extras
* notify-daemon - EOL notification

### Warning
This script uses a patched version of PHP Simple HTML DOM Parser.  
To use non-patched version, place simple_html_dom.php in php_lib/simple_html_dom  
For more info about patch, see simple_html_dom-patched/README.txt
