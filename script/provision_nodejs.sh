#!/bin/bash

# https://github.com/nodenv/nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(nodenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update
nodenv update

nodenv install 12.13.0
nodenv rehash
nodenv global 12.13.0

# rootでnodeを使用する場合(暫定？)
# sudo ln -s /home/vagrant/.nodenv/shims/node /usr/local/bin/
# sudo ln -s /home/vagrant/.nodenv/shims/npm /usr/local/bin/
# sudo ln -s /home/vagrant/.nodenv/shims/npx /usr/local/bin/