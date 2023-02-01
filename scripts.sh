#! /bin/bash
pushd ssl
cat server-cert.pem server-key.pem > mongo-server-key.pem
cat ca-cert.pem client-cert.pem > mongo-server-ca.pem
cat ca-cert.pem > mongo-client-ca.pem
cat client-cert.pem client-key.pem > mongo-client-key.pem
popd

pushd keyfile
openssl rand -base64 768 > keyfile.txt
chmod 600 keyfile.txt
popd