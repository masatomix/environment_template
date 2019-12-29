#!/bin/sh

sudo apt install -y squid
sudo apt install -y apache2-utils

cd /vagrant/squid
sudo docker-compose up -d

# cf.
# https://github.com/sameersbn/docker-squid/blob/master/docker-compose.yml