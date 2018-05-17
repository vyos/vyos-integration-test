#!/bin/vbash

if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi

source /opt/vyatta/etc/functions/script-template

set system host-name router
set system domain-name example.com
set system time-zone Asia/Tokyo

commit
save
