# Install buttefly

`sudo pip install butterfly`

`sudo mcedit /etc/init/buttefly.conf`

    description "butterfly service"

    start on runlevel [2345]
    respawn
    expect fork

    exec butterfly.server.py --host="0.0.0.0"

# Install rubies through rvm

`rvm install ruby-1.9.3-p194`
`rvm install ruby-2.0.0`

# Modify .bashrc
    export LC_CTYPE=en_US.UTF-8
    export LANG=en_US.UTF-8

# Add vagrant user to shared folder group

`sudo adduser vagrant vboxsf`