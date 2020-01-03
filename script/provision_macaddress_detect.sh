#!/bin/bash

# nodenv install 8.11.3
# nodenv rehash
# nodenv global 8.11.3
# source ~/.bash_profile

cd /vagrant/
git clone https://github.com/masatomix/macaddress_detect.git
cd macaddress_detect
sudo docker-compose up -d --build

# config/default.json,local.json を要修正(NICの名前が可変のため)