#!/bin/sh -eux

groupadd vagrant
useradd -g "vagrant" vagrant
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";
PUBLIC_KEY="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub";

mkdir -p $HOME_DIR/.ssh;

if command -v wget >/dev/null 2>&1; then
    wget --no-check-certificate "$PUBLIC_KEY" -O $HOME_DIR/.ssh/authorized_keys;

elif command -v curl >/dev/null 2>&1; then
    curl --insecure --location "$PUBLIC_KEY" > $HOME_DIR/.ssh/authorized_keys;

elif command -v fetch >/dev/null 2>&1; then
    fetch -am -o $HOME_DIR/.ssh/authorized_keys "$PUBLIC_KEY";

else
    echo "Cannot download vagrant public key";
    exit 1;
fi

chown -R vagrant $HOME_DIR/.ssh;

chmod -R go-rwsx $HOME_DIR/.ssh;
