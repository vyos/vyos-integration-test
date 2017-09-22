#!/bin/vbash

if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi

source /opt/vyatta/etc/functions/script-template

set protocols bgp 65537 parameters router-id 10.0.3.14

set protocols bgp 65537 neighbor 10.0.3.12 remote-as 65537
set protocols bgp 65537 neighbor 10.0.3.12 update-source 10.0.3.14
set protocols bgp 65537 neighbor 10.0.3.12 advertisement-interval 1

set protocols bgp 65537 network 10.0.3.0/24

commit
save
