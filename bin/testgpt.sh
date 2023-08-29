#!/bin/bash

for value in $(seq 10 10 100)
do
    if [ -n "$prev_value" ]; then
        sign+="=="
    fi

    echo -ne "\r$value% |$sign"
    prev_value="$value"
    if [ $value -ne 100 ] ; then
                echo -n ">"
    fi
    sleep 1	

    if [ $value -ne 100 ] ; then
                echo ""
        else
                echo -ne "| complete\n"
    fi
done





