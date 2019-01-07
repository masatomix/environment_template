#!/bin/sh

# https://github.com/Runscope/requestbin
# cd /vagrant/
git clone git://github.com/Runscope/requestbin.git
cd requestbin
sudo docker-compose build
sudo docker-compose up -d



