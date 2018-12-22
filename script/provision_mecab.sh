#!/bin/bash

# install mecab
sudo apt install -y  swig  mecab libmecab-dev mecab-ipadic-utf8


# install mecab-ipadic-neologd  -n(更新する) -y(聞かない)
git clone https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd/
sudo ./bin/install-mecab-ipadic-neologd -n -y










