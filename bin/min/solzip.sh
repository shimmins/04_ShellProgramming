#!/bin/bash

#
# 1) 일반 압축
# xz, bz2, gz
# 2) 비밀번호 압축/해제
# 7z
# 3) 압축 해제
#
# 절대경로 입력을 해야만 함
#
. /root/bin/min/function.sh

while true
do
    ZipMenu
    echo -n "메뉴를 선택해주세요 : "
    read MENUCHOICE
    echo

    case $MENUCHOICE in
        1) Compress
            ;;


        2) PWComp 
            ;;

        3) Archive ;;

        4) figlet -f small "BYE BYE"
            break
            ;;
        
        *) : ;;
    esac





done

