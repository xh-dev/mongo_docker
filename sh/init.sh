#!/bin/bash

mongosh mongodb://localhost:27017 --tls \
  --tlsCAFile /data/ssl/mongo-client-ca.pem \
  --tlsCertificateKeyFile /data/ssl/mongo-client-key.pem \
  --file /scripts/test-status.js --quiet