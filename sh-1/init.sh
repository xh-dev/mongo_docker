#!/bin/bash

mongosh mongodb://mongo-1.example.com:27017 --tls \
  --tlsCAFile /data/ssl/mongo-client-ca.pem \
  --tlsCertificateKeyFile /data/ssl/mongo-client-key.pem <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo-1.example.com:27017",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mongo-2.example.com:27027",
            "priority": 2
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF