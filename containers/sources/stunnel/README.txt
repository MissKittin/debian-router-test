How to use: run as root
1) mkdir .container .ssl
2) chmod 700 .ssl
3) ./start.sh generate-certificate hostname.domain
4) make config files in etc/stunnel
5) create root tree, put config files, set /ssl/server.pem as certificate path
6) tar root tree, gzip, rename to .config.tar.gz
7) send .ssl/rootCA.pem to clients
8) ./start.sh strip
