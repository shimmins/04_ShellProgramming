#!/bin/bash

installsim(){
sign="="
prev_value=""

for value in $(seq 25 25 100)
do
    if [ -n "$prev_value" ]; then
        sign+="========="
    fi

    printf "\r$value%% |$sign"

    if [ $value -ne 100 ]; then
        printf ">"
    else
        printf "| complete!\n"
    fi

    prev_value="$value"
    sleep 0.2
done
}