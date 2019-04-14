#!/bin/bash


# https://pip.pypa.io/en/latest/installing/
curl https://bootstrap.pypa.io/get-pip.py -O
sudo python3 get-pip.py
# sudo apt install -y python3-pip

sudo apt install -y libbz2-dev
sudo apt install -y python3-dev python3-venv
sudo apt install -y zlib1g-dev libffi-dev libssl-dev
sudo apt install -y python-tk tk-dev

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
source  ~/.bash_profile

pyenv install 3.7.1
pyenv global 3.7.1