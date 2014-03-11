# Manual job to do after vagrant image is up

## Create buttefly init script

`sudo mcedit /etc/init/buttefly.conf`

    description "butterfly service"

    start on runlevel [2345]
    respawn
    expect fork

    exec butterfly.server.py --host="0.0.0.0"

## Install rubies through rvm

`rvm install ruby-1.9.3-p194`
`rvm install ruby-2.0.0`
`rvm use ruby-1.9.3-p194 --default`

## Modify .bashrc
    export LC_CTYPE=en_US.UTF-8
    export LANG=en_US.UTF-8

## Bundle install by project's Gemfile