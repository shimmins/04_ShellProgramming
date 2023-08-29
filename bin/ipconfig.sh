#!/bin/bash

# (1) Host Name
# (2) Connection Name
# (3) Ethernet Adapter
# (4) IPv4 Address
# (5) Defalt Gateway
# (6) DNS Servers

# (0) Variavle definition
export LANG=en_US.UTF-8
TMP1=/tmp/tmp1


# (1) Host Name
HOST=$(hostname)
echo
echo "Host Name ............ : $HOST"

# (2) Connection Name
nmcli -f NAME connection | tail -n +2 > $TMP1
for CON in $(cat $TMP1)
do
    # (3) Ethernet Adapter
    NIC=$(echo $(nmcli connection show $CON | grep "connection.interface-name:" | awk '{print $2}'))
    
    # (4) IPv4 Address
    IP1=$(echo $(nmcli connection show $CON | grep "ipv4.addresses:" | awk '{print $2}'))
   
    # (5) Defalt Gateway
    GW1=$(echo $(nmcli connection show $CON | grep "ipv4.gateway:" | awk '{print $2}'))
    
    # (6) DNS Servers
    DNS1=$(echo $(nmcli connection show $CON | grep "ipv4.dns:" | awk '{print $2}'))
    
    # (7) Output
    cat << EOF

Connection Name ...... : $CON
Ethernet adapter ..... : $NIC
IPv4 Address ......... : $IP1
Default Gateway ...... : $GW1
DNS Servers .......... : $DNS1
EOF

done