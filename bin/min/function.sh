. /root/bin/min/function2.sh
ZipMenu() {
    cat << EOF
---------- 기본 메뉴 ----------
(1) 일반 압축

(2) 비밀번호 압축/해제

(3) 압축 해제

(4) 종료
-------------------------------
EOF

}

Compress() {
    cat << EOF
---------- 압축 메뉴 ----------
(1) GZIP 압축  *빠른 속도*

(2) BZIP 압축  *높은 압축률*

(3)  XZ  압축  *최대 압축률*

(4) 이전 메뉴로
-------------------------------
EOF

echo -n "메뉴를 선택해주세요 : "
read ZIPMENUCHOICE

    case $ZIPMENUCHOICE in
        1) GZIPC ;;

        2) BZIPC ;;

        3) XZC ;;

        4) echo : 
            return ;;
        
        
    esac
}

PWComp() {
        cat << EOF
----------------- 비밀번호 압축 --------------------
* $(echo -e "\e[33m비밀번호 압축/해제 에는 7z 프로그램이 필요합니다\e[0m*")

* $(echo -e "\e[33m메뉴 선택 시 7z 프로그램이 없을 경우 자동 설치\e[0m*")

(1) 압축 실행 

(2) 압축 해제

(3) 이전 메뉴로
----------------------------------------------------
EOF
    echo -n "메뉴를 선택해주세요 : "
    read ZIPMENUCHOICE

    case $ZIPMENUCHOICE in
        1) 7Z ;;

        2) 7ZUZ ;;

        3) echo : 
        return ;;

           
    esac

}

Archive(){
    cat << EOF
-------------- 압축 해제 --------------

(1) 압축 해제 (확장명: gz|bz2|xz)

(2) 이전 메뉴로
---------------------------------------
EOF

    echo -n "메뉴를 선택해주세요 : "
    read ZIPMENUCHOICE

        case $ZIPMENUCHOICE in
            1)  UNZIP ;;

            2) echo : 
            return ;;

            
        esac

}