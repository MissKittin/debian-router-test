#!/bin/sh
dns_link="${1}"
if [ "${dns_link}" = '' ]; then
	echo 'generate-certificate.sh dns-link'
	exit 1
fi

# Workdir
[ -e '/ssl' ] || mkdir '/ssl'
cd '/ssl'

# CA gen
openssl genrsa -out ./rootCA.key 2048
openssl req -x509 -new -nodes -key ./rootCA.key -sha256 -days 36500 -out ./rootCA.pem -subj '/CN=${dns_link}/O=${dns_link}/OU=${dns_link}'

# Server - certificate params
echo 'authorityKeyIdentifier=keyid,issuer' > '/v3.ext'
echo 'basicConstraints=CA:FALSE' >> '/v3.ext'
echo 'keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment' >> '/v3.ext'
echo 'subjectAltName = @alt_names' >> '/v3.ext'
echo '' >> '/v3.ext'
echo '[alt_names]' >> '/v3.ext'
echo "DNS.1 = ${dns_link}" >> '/v3.ext'

# Server - certificate gen
openssl req -new -newkey rsa:2048 -nodes -keyout ./server.key -subj '/C=SE/ST=None/L=NB/O='"${dns_link}"'/CN='"${dns_link}" -out ./server.csr
openssl x509 -req -in ./server.csr -CA ./rootCA.pem -CAkey ./rootCA.key -CAcreateserial -out ./server.crt -days 36500 -sha256 -extfile /v3.ext

# key+certificate for stunnel
cat './server.key' './server.crt' > './server.pem'
chmod 600 './server.pem'

# remove config
rm '/v3.ext'

echo ' ! send /ssl/rootCA.pem to the client'
echo ' ! copy rootCA.pem and server.pem from the /ssl directory'
echo ' ! point to /ssl/server.pem in stunnel config file'
exit 0
