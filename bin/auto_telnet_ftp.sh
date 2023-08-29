#!/bin/bash

SERVERLIST=/root/bin/server_telnet.txt

# 1) 원격 접속 후 백업 수행 -> auto_telnet.sh(tar CMD)
#   tar CMD: tar czf /tmp/home_$(hostname).tar.gz /home


cat $SERVERLIST | while read IP1 UNAME UPASS
do
    BACKUPFILE="home_$IP1.tar.gz"
    CmdBackup() {
        sleep 2     ; echo "$UNAME"
        sleep 0.5   ; echo "$UPASS"
        sleep 0.5   ; echo "tar czf /tmp/$BACKUPFILE /home"
        sleep 0.5   ; echo 'exit'
    }
    CmdBackup | telnet $IP1

ftp -n $IP1 << EOF
    user $UNAME $UPASS
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mget $BACKUPFILE
    quit
EOF
done

