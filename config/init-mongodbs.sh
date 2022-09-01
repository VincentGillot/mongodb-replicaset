#!/bin/bash

# Setup data folders
mkdir -p /mongo/data/replica1/data
mkdir -p /mongo/data/replica2/data
mkdir -p /mongo/data/replica3/data

# Create root user
mongod --dbpath /mongo/data/replica1/data --logpath /mongo/data/replica1/log --fork --port 27017
mongosh <./create-root.js
sleep 20s

# Create keyfile
echo ${KEY_FILE_SECRET} >./file.key
chmod 400 ./file.key

# Launch mongo instances
mongod --dbpath /mongo/data/replica1/data --logpath /mongo/data/replica1/log --keyFile ./file.key --fork --port 27017 --bind_ip_all --replSet rs0
mongod --dbpath /mongo/data/replica2/data --logpath /mongo/data/replica2/log --keyFile ./file.key --fork --port 27018 --bind_ip_all --replSet rs0
mongod --dbpath /mongo/data/replica3/data --logpath /mongo/data/replica3/log --keyFile ./file.key --fork --port 27019 --bind_ip_all --replSet rs0

# Initiate replica set
mongosh <./init.js
sleep 20s

# Create client user
mongosh <./create-user.js
sleep infinity
