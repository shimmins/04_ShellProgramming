#!/bin/bash

"alias" fwcmd
if [ $? -eq 0 ]; then
    echo "[  OK  ] $HOME/.bashrc 환경 설정 성공"
else
    echo "[ FAIL ] $HOME/.bashrc 환경 설정 실패"
    exit 1
fi