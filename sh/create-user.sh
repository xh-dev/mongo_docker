#!/bin/bash

mongosh mongodb://localhost:27017 --tls \
  --tlsCAFile /data/ssl/mongo-client-ca.pem \
  --tlsCertificateKeyFile /data/ssl/mongo-client-key.pem --quiet <<EOF
use admin

rootUser="root"
rootPassword="Abcd1234"

userToAdd = [
	{user:"xeth",pwd:"Abcd1234",roles:[{role:"readWrite",db:"testDB"}]}
]

print("============= auth user")

let create_root_user = ()=>{
	const createRootResult = db.createUser({user:rootUser,pwd:rootPassword,roles:[{role:"userAdminAnyDatabase",db:"admin"}]})
	if(!(createRootResult && createRootResult.ok === 1)){
		quit(2001)
	}
	return createRootResult
}

try{
	db.auth(rootUser, rootPassword)
} catch(error){
	if( error.ok === 0 && error.code===18){
		create_root_user()

    db.auth(rootUser, rootPassword)
    for( user of userToAdd){
      try{
        addResult = db.createUser(user)
        print(addResult)
      } catch(error){
        quit(2002)
      }
    }
	}
	else {
		quit(2002)
	}
}

db.auth(rootUser, rootPassword)
EOF
