#!/bin/bash

pyenv global 3.7.1
cd /vagrant/samples
python -m venv ~/venv/
source ~/venv/bin/activate
pip install -r requirement.txt
