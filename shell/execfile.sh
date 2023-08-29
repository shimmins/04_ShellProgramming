#!/bin/bash

echo -n "실행할 프로그램은(반드시 절대경로 지정): "
read CMD

echo $CMD
if [ -x "$CMD" ] ; then
    $CMD
else
    echo "[ FAIL ] 실행권한 없습니다."
    exit 1
fi
