#!/bin/bash

mongosh mongodb://mongo.example.com:27017 --tls \
  --tlsCAFile /data/ssl/mongo-client-ca.pem \
  --tlsCertificateKeyFile /data/ssl/mongo-client-key.pem <<EOF
use admin
db.createUser({user:"root",pwd:"Abcd1234",roles:[{role:"userAdminAnyDatabase",db:"admin"}]})
db.auth("root", "Abcd1234")
db.createUser({user:"xeth",pwd:"Abcd1234",roles:[{role:"readWrite",db:"testDB"}]})
EOF