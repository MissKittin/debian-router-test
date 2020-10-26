# ddns-client
Send/update your public IPv4 to your shared hosting and protect it.  
**This script requires wget.**

# ddns-server
Edit `ddns-server/settings.php` and upload whole directory to shared hosting.  
For more info read `ddns-server/README.txt`.

# ip-info
The script needs to get a public IP from somewhere. It gets this information by default from `http://ipinfo.io/ip`.  
But if you don't have a similar site, upload whole `ip-info` directory to your shared hosting and update `ip_get_address` field in `etc/ddns-client.rc`.

# How it works
This script looks for your public IP and sends it to the ddns-server if changes.  
Just run `install.sh` (and `extras-install.sh` if you want) and edit `etc/ddns-client.rc` with the same parameters as in `settings.php`.  
To view your IP, type in the browser address bar:  
`http://yourdomain.eg/ddns-server/?user=$view_user&password=$view_password`  
You can also add `&notime` parameter for IP-only output.

# Extras
* rc.local script - log file path
