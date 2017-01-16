#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set protocols static route6 fd00:5679:4f53:2::/64 next-hop fd00:5679:4f53:3::b

commit
save
