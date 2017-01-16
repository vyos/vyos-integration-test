#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set protocols bgp 65537 neighbor fd00:5679:4f53:1::b ebgp-multihop 2 
set protocols bgp 65537 neighbor fd00:5679:4f53:1::b remote-as 65536 
set protocols bgp 65537 neighbor fd00:5679:4f53:1::b update-source eth1
set protocols bgp 65537 neighbor fd00:5679:4f53:1::b advertisement-interval 1
set protocols bgp 65537 neighbor fd00:5679:4f53:1::b address-family ipv6-unicast
set protocols bgp 65537 address-family ipv6-unicast network fd00:5679:4f53:3::/64
set protocols bgp 65537 parameters router-id 10.0.1.12

commit
save
