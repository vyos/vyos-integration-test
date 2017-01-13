#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set protocols bgp 65536 neighbor 10.0.1.12 ebgp-multihop 2 
set protocols bgp 65536 neighbor 10.0.1.12 remote-as 65537 
set protocols bgp 65536 neighbor 10.0.1.12 update-source 10.0.1.11
set protocols bgp 65536 neighbor 10.0.1.12 advertisement-interval 1
set protocols bgp 65536 network 10.0.2.0/24
set protocols bgp 65536 parameters router-id 10.0.1.11

commit
save
