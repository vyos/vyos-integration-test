#!/bin/vbash

if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi

source /opt/vyatta/etc/functions/script-template

set protocols ospf area 0.0.0.0 network 10.0.1.0/24
set protocols ospf area 0.0.0.0 network 10.0.3.0/24
set protocols ospf passive-interface eth2

commit
save
