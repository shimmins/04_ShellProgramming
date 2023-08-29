#!/bin/bash
# ENV3.sh : 패키지 설치
# * gcc

echo "===== [ PHASE 3 :패키지 설치 ] ====="

. /root/bin/functions.sh

# (1) 패키지 설치 절차
# * yum -y install gcc
PkgInstall gcc