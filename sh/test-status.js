
let initBlock = ()=>{
    let config = {
        "_id": "dbrs",
        "version": 1,
        "members": [
            {
                "_id": 1,
                "host": "mongo-1:27017",
                "priority": 3
            },
            {
                "_id": 2,
                "host": "mongo-2:27027",
                "priority": 2
            }
        ]
    };
    const initResult = rs.initiate(config, { force: true });
    return initResult
}

try{
    rs.status()
} catch(error){
    if ( ! (error.ok === 0 && error.code === 94)){
        quit(1001)
    }
    initBlock()
}


const initStatus = rs.status();
print(initStatus)
if(initStatus && initStatus.ok===1 && initStatus.myState === 1){
	quit(0)
} else {
	quit(100)
}
