#! /bin/bash
pushd ssl
cat server-1-cert.pem server-1-key.pem > mongo-server-1-key.pem
cat server-2-cert.pem server-2-key.pem > mongo-server-2-key.pem

cat ca-cert.pem client-cert.pem > mongo-server-ca.pem

cat ca-cert.pem > mongo-client-ca.pem
cat client-cert.pem client-key.pem > mongo-client-key.pem
popd

pushd keyfile
openssl rand -base64 768 > keyfile.txt
chmod 600 keyfile.txt
popd
