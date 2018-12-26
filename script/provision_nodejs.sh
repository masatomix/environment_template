#!/bin/bash

git clone https://github.com/riywo/ndenv ~/.ndenv
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
source  ~/.bash_profile
git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build

ndenv install v10.14.2
ndenv rehash
ndenv global v10.14.2

# https://github.com/angular/angular-cli/issues/7735
# echo -e 'export PATH=$(npm prefix -g)/bin:$PATH' >> ~/.bash_profile
# source  ~/.bash_profile