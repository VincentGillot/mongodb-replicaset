#!/bin/bash

# INSTALL MONGO
apt update -y
apt upgrade -y
apt-get install wget -y
apt-get install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
apt-get update -y
apt-get install -y mongodb-org

# EXECUTE MONGO DATABASE
/bin/bash ./init-mongodbs.sh
