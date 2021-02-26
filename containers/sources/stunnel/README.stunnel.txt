How to use: run as root
1) cd to this dir
2) mkdir ./.container ./.ssl
3) chmod 700 ./.ssl
4) ./start.sh
5) here you can generate certificates

How to generate certificates: run as root
1) cd to this dir
2) cp ./.generate-certificate.sh ./.container/mnt/generate-certificate.sh
3) chmod 755 ./.container/mnt/generate-certificate.sh
4) ./console.sh
5) /generate-certificate.sh hostname.domain
6) exit
7) certificates are in .ssl directory
8) send .ssl/rootCA.pem to clients (for windows you can rename extension to crt)
9) here you can configure stunnel daemon

How to configure stunnel: run as root
1)  ./console.sh
2)  edit stunnel files
3)  exit
4)  cd /tmp
5)  mkdir ./config
6)  cd ./config
7)  mkdir -p ./etc/stunnel4 ./etc/default
8)  dump config files from .container/diff/etc/stunnel4 to ./etc/stunnel4
9)  dump .container/diff/etc/default/stunnel4 to ./etc/default/stunnel4
10) tar cvf /tmp/.config.tar ./etc
11) cd ..
12) gzip -9 ./.config.tar.gz
13) rm -r -f ./config
14) move .config.tar.gz to the container directory (not .container)
15) cd to the container directory
16) ./stop.sh
17) ./start.sh strip
18) test your configuration

Run container normally: ./start.sh strip
