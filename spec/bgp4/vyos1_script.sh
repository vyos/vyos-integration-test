#!/bin/vbash

if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi

source /opt/vyatta/etc/functions/script-template

set protocols bgp 65536 parameters router-id 10.0.1.11

set protocols bgp 65536 neighbor 10.0.1.12 remote-as 65537
set protocols bgp 65536 neighbor 10.0.1.12 update-source 10.0.1.11
set protocols bgp 65536 neighbor 10.0.1.12 advertisement-interval 1

set protocols bgp 65536 neighbor 10.0.2.13 remote-as 65536
set protocols bgp 65536 neighbor 10.0.2.13 update-source 10.0.2.11
set protocols bgp 65536 neighbor 10.0.2.13 advertisement-interval 1
set protocols bgp 65536 neighbor 10.0.2.13 nexthop-self

commit
save
