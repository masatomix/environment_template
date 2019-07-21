#!/bin/sh

# install zabbix agent
wget http://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2%2Bxenial_all.deb
sudo dpkg -i zabbix-release_4.0-2+xenial_all.deb
sudo apt update
sudo apt install -y zabbix-agent


# /etc/zabbix/zabbix_agentd.conf
# Server=127.0.0.1 -> Server=127.0.0.1, 192.168.33.0/24
sudo cp -pfr /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.org
sudo sed -i -e 's/Server=127.0.0.1/Server=127.0.0.1,192.168.33.0\/24/g' /etc/zabbix/zabbix_agentd.conf

sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent
