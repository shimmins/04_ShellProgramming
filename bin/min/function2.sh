# EDIT
. /root/bin/min/install.sh
RED='\033[0;31m'


GZIPC() {
    while true
    do
        echo
        echo -e "${RED}현재 폴더 위치 >>> : " $(pwd) 
        echo 
        echo -e "${RED}현재 폴더 파일 >>> : \e[0m" $(ls --color=always) 
        echo 
        echo -n "* 압축파일 선택(ex: /test/file1) : "
        read FILE1
        echo -n "* 압축 파일 위치 선택 (/root/bin, 원본 파일과 같은 위치면 <ENTER>) : " 
        read LOCATION1
        
cat << EOF
    
    ** 압축 파일: $FILE1
    ** 압축 파일 위치: $LOCATION1
    
EOF
    echo -n "선택이 맞습니까? (y/n) : "
        read YESNO
        case $YESNO in
            y|Y|yes|Yes|YES) break ;;
            n|N|no|No|No)    : ;;
            *) echo "y 또는 n을 입력해야 합니다." ;;
        esac
    done

gzip $FILE1 >> /dev/null 2>&1
    if [ $? -eq 0 ]; then
        installsim
        mv $FILE1.gz $LOCATION1 >> /dev/null 2>&1
        sleep 0.5
        echo
        echo "엔터키를 누르면 종료 됩니다"
        read dumy
    return
    else
        echo
        echo -e "${RED}[ ERROR ] 압축 실패 - 입력 내용 확인 필요\e[0m"
        echo
        return
    fi
}

BZIPC() {
    while true
    do
        echo
        echo -e "${RED}현재 폴더 위치 >>> : " $(pwd) 
        echo
        echo 
        echo -e "${RED}현재 폴더 파일 >>> : \e[0m" $(ls --color=always) 
        echo 
        echo -n "* 압축파일 선택(ex: /test/file1) : "
        read FILE1
        echo -n "* 압축 파일 위치 선택 (/root/bin, 원본 파일과 같은 위치면 <ENTER>) : " 
        read LOCATION1
cat << EOF
    
    ** 압축 파일: $FILE1
    ** 압축 파일 위치: $LOCATION1
    
EOF
    echo -n "선택이 맞습니까? (y/n) : "
        read YESNO
        case $YESNO in
            y|Y|yes|Yes|YES) break ;;
            n|N|no|No|No)    : ;;
            *) echo "y 또는 n을 입력해야 합니다." ;;
        esac
    done

bzip2 $FILE1 >> /dev/null 2>&1
if [ $? -eq 0 ]; then
        installsim
        mv $FILE1.bz2 $LOCATION1 >> /dev/null 2>&1
        sleep 0.5
        echo
        echo "엔터키를 누르면 종료 됩니다"
        read dumy
    return
    else
        echo
        echo -e "${RED}[ ERROR ] 압축 실패 - 입력 내용 확인 필요\e[0m"
        echo
        return
    fi
}

XZC() {
        while true
    do
        echo
        echo -e "${RED}현재 폴더 위치 >>> : " $(pwd) 
        echo
        echo 
        echo -e "${RED}현재 폴더 파일 >>> : \e[0m" $(ls --color=always) 
        echo 
        echo -n "* 압축파일 선택(ex: /test/file1) : "
        read FILE1
        echo -n "* 압축 파일 위치 선택 (/root/bin, 원본 파일과 같은 위치면 <ENTER>) : " 
        read LOCATION1
        
cat << EOF
    
    ** 압축 파일: $FILE1
    ** 압축 파일 위치: $LOCATION1
    
EOF
    echo -n "선택이 맞습니까? (y/n) : "
        read YESNO
        case $YESNO in
            y|Y|yes|Yes|YES) break ;;
            n|N|no|No|No)    : ;;
            *) echo "y 또는 n을 입력해야 합니다." ;;
        esac
    done

xz -z $FILE1 >> /dev/null 2>&1
if [ $? -eq 0 ]; then
        installsim
        mv $FILE1.xz $LOCATION1 >> /dev/null 2>&1
        sleep 0.5
        echo
        echo "엔터키를 누르면 종료 됩니다"
        read dumy
    return
    else
        echo
        echo -e "${RED}[ ERROR ] 압축 실패 - 입력 내용 확인 필요\e[0m"
        echo
        return
    fi
}




7Z() {
    rpm -qa | grep "p7zip-plugins" >> /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo
        echo "설치 확인 완료"
    else
        yum -y install p7zip-plugins > /dev/null 2>&1
        echo
        echo "설치 완료"
    fi
    
    while true
        do
            echo
            echo -e "${RED}현재 폴더 위치 >>> : " $(pwd) 
            echo
            echo 
            echo -e "${RED}현재 폴더 파일 >>> : \e[0m" $(ls --color=always) 
            echo 
            echo
            echo -n "* 압축파일 선택(ex: /test/file1) : "
            read FILE1
            
            echo -n "* 압축 파일 위치 선택 (ex: /root/bin, *입력하지 않으면 현재 위치) : " 
            read LOCATION1

            echo -n "* 압축할 파일명 : "
            read ENDFILE
            
            echo -n "* 비밀번호 (ex: 1234) : "
            read PWD1
cat << EOF
        
            ** 압축 파일: $FILE1
            ** 압축한 파일명: $ENDFILE
            ** 압축 파일 위치: $LOCATION1
            ** 비밀번호: $PWD1

EOF
            echo -n "선택이 맞습니까? (y/n) : "
                read YESNO
                case $YESNO in
                    y|Y|yes|Yes|YES) break ;;
                    n|N|no|No|No)    : ;;
                    *) echo "y 또는 n을 입력해야 합니다." ;;
                esac
        done
7z a -p$PWD1 $ENDFILE.7z $FILE1 >> /dev/null 2>&1
if [ $? -eq 0 ]; then
        installsim
        mv $ENDFILE.7z $LOCATION1 >> /dev/null 2>&1
        sleep 0.5
        echo
        echo "엔터키를 누르면 종료 됩니다"
        read dumy
    return
    else
        echo
        echo -e "${RED}[ ERROR ] 압축 실패 - 입력 내용 확인 필요\e[0m"
        echo
        return
    fi

}

UNZIP() {
    while true
    do
        echo
        echo -e "${RED}현재 폴더 위치 >>> : " $(pwd) 
        echo
        echo 
        echo -e "${RED}현재 폴더 파일 >>> : " $(ls --color=always) 
        echo 
        echo -n "* 압축파일 선택(확장명: gz|bz2|xz) : "
        read FILE1
        case $FILE1 in
        *.gz) gunzip $FILE1 
            break
            ;;

        *.bz2) bunzip2 $FILE1 
            break
            ;;
        *.xz) unxz $FILE1 
            break
            ;;
        esac
    done

    installsim
    sleep 0.5
    echo
    echo "엔터키를 누르면 종료 됩니다"
    read dumy
    return

}

7ZUZ() {
     rpm -qa | grep "p7zip-plugins" >> /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo
        echo "설치 확인 완료"
    else
        yum -y install p7zip-plugins > /dev/null 2>&1
        echo
        echo "설치 완료"
    fi
    while true
    do
        echo
        echo -e "${RED}현재 폴더 위치 >>> : " $(pwd) 
        echo
        echo 
        echo -e "${RED}현재 폴더 파일 >>> : " $(ls --color=always) 
        echo 
        echo -n "* 비밀번호가 설정된 7z 파일 선택 : "
        read FILE1
        echo -n "* 해제 파일 위치 지정  : "
        read LOCATION1
        echo -n "* 비밀번호 입력  : "
        read PWD1
        cat << EOF
        
            ** 압축 파일: $FILE1
            ** 해제 위치: $LOCATION1
            ** 비밀번호 : $PWD1

EOF
            echo -n "선택이 맞습니까? (y/n) : "
                read YESNO
                case $YESNO in
                    y|Y|yes|Yes|YES) break ;;
                    n|N|no|No|No)    : ;;
                    *) echo "y 또는 n을 입력해야 합니다." ;;
                esac

    done
7z x -p$PWD1 $FILE1 -o$LOCATION1 >> /dev/null 2>&1
    if [ $? -eq 0 ]; then
        installsim
        sleep 0.5
        echo
        echo "엔터키를 누르면 종료 됩니다"
        read dumy
    return
    else
        echo
        echo -e "${RED}[ ERROR ] 해제 실패 - 입력 내용 확인 필요\e[0m"
        echo
        return
    fi
}