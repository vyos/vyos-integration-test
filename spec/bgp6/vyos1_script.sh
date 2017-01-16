#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set protocols bgp 65536 neighbor fd00:5679:4f53:1::c ebgp-multihop 2 
set protocols bgp 65536 neighbor fd00:5679:4f53:1::c remote-as 65537 
set protocols bgp 65536 neighbor fd00:5679:4f53:1::c update-source eth1
set protocols bgp 65536 neighbor fd00:5679:4f53:1::c advertisement-interval 1
set protocols bgp 65536 neighbor fd00:5679:4f53:1::c address-family ipv6-unicast
set protocols bgp 65536 address-family ipv6-unicast network fd00:5679:4f53:2::/64
set protocols bgp 65536 parameters router-id 10.0.1.11

commit
save
