var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo-1:27017",
            "priority": 3
        }
    ]
};
try{
  rs.initiate(config, { force: true });
  rs.status();
}
exception(e){
  console.log(e);
  exit(1)
}
