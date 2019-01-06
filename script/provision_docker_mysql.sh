#!/bin/sh

sudo apt install -y mysql-client-core-5.7
cd /vagrant/mysql
mkdir -p ./db/mysql_data
sudo docker-compose up -d --build
