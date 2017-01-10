#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set vpn ipsec ike-group ike-g proposal 1 encryption aes256
set vpn ipsec ike-group ike-g proposal 1 hash sha1
set vpn ipsec ike-group ike-g proposal 1 dh-group 2
set vpn ipsec ike-group ike-g lifetime 28800
set vpn ipsec ike-group ike-g dead-peer-detection action restart
set vpn ipsec ike-group ike-g dead-peer-detection interval 15
set vpn ipsec ike-group ike-g dead-peer-detection timeout 90

set vpn ipsec esp-group esp-g proposal 1 encryption aes256
set vpn ipsec esp-group esp-g proposal 1 hash sha1
set vpn ipsec esp-group esp-g lifetime 3600

set vpn ipsec ipsec-interfaces interface eth1

set vpn ipsec site-to-site peer 10.0.1.11 authentication mode pre-shared-secret
set vpn ipsec site-to-site peer 10.0.1.11 authentication pre-shared-secret test
set vpn ipsec site-to-site peer 10.0.1.11 ike-group ike-g
set vpn ipsec site-to-site peer 10.0.1.11 default-esp-group esp-g
set vpn ipsec site-to-site peer 10.0.1.11 local-address 10.0.1.12
set vpn ipsec site-to-site peer 10.0.1.11 tunnel 1 local prefix 10.0.3.0/24
set vpn ipsec site-to-site peer 10.0.1.11 tunnel 1 remote prefix 10.0.2.0/24

commit
save
