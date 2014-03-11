#!/usr/bin/env bash

apt-get install -y libcurl4-openssl-dev

# install butterfly
sudo pip install butterfly

# add vagrant user to virtualbox shared folder group
sudo adduser vagrant vboxsf