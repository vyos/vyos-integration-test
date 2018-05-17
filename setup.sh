#!/bin/bash

sudo apt-get update
sudo apt-get -qqy build-dep vagrant ruby-libvirt
sudo apt-get -qqy install qemu-system-x86 qemu-utils qemu-kvm libvirt-daemon-system ebtables dnsmasq
sudo apt-get -qqy install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
getent group libvirtd && sudo adduser $USER libvirtd
sudo adduser $USER kvm
wget https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_x86_64.deb && sudo dpkg -i vagrant_2.1.1_x86_64.deb
vagrant plugin install vagrant-vyos
vagrant plugin install vagrant-libvirt
sudo gem install bundler
bundle install
