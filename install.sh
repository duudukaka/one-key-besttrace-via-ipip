#!/bin/bash

source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    sudo apt-get update&&sudo apt install unzip -y
    ;;
centos|fedora|rhel)
    yumdnf="yum"
    if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0; then
        yumdnf="dnf"
    fi
    sudo $yumdnf update -y&&sudo
    ;;
*)
    exit 1
    ;;
esac
wget https://cdn.ipip.net/17mon/besttrace4linux.zip -P /tmp
unzip /tmp/besttrace4linux.zip
sudo cp /tmp/besttrace /bin/&&sudo chmod 755 /bin/besttrace
rm -rf /tmp/besttrace*
