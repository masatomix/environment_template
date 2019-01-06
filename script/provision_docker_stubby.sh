#!/bin/sh

# https://github.com/Runscope/requestbin
cd /vagrant/stubby-docker
sudo docker-compose build
sudo docker-compose up -d



