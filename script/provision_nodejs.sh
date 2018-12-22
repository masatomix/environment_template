#!/bin/bash

git clone https://github.com/riywo/ndenv ~/.ndenv
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
source  ~/.bash_profile
git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build

ndenv install v10.14.2
ndenv global v10.14.2