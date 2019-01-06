#!/bin/bash

# 設定を日本語に
# https://forums.ubuntulinux.jp/viewtopic.php?id=18355
sudo locale-gen ja_JP.UTF-8
sudo apt -y install language-pack-ja-base language-pack-ja ibus-mozc
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
source /etc/default/locale

sudo timedatectl set-timezone Asia/Tokyo

echo export LC_CTYPE=ja_JP.UTF-8 >> ~/.bash_profile
# echo export LC_ALL=ja_JP.UTF-8 >> ~/.bash_profile
source ~/.bash_profile


sudo apt install -y build-essential nmap jq