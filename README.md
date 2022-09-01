# mongodb-replicaset

This image deploys a mongodb replica set database. Meant for development.

## Github

https://github.com/VincentGillot/mongodb-replicaset

### Connection

This instance deploys on localhost:27017,localhost:27018,localhost:27019

##### Connection string

`mongodb://{MONGO_CLIENT_USER}:{MONGO_CLIENT_PASSWORD}@localhost:27017,localhost:27018,localhost:27019/{MONGO_CLIENT_DATABASE}?replicaSet=rs0&readPreference=primary&ssl=false&authSource=admin`

### Database

The database files are saved to the following directories:

- /mongo/data/replica1/data
- /mongo/data/replica2/data
- /mongo/data/replica3/data

##### Using a volume

```
volumes:
  - ./database:/mongo/data
```

### Environment Variables

- KEY_FILE_SECRET=mysecretkey
- MONGO_ROOT_USER=root
- MONGO_ROOT_PASSWORD=root
- MONGO_CLIENT_USER=client
- MONGO_CLIENT_PASSWORD=client
- MONGO_CLIENT_DATABASE=main

##### Keyfile

This file is created and used for the replicaset keyFile parameter.
