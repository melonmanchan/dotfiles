#!/usr/bin/env bash

setxkbmap -query | grep -q "layout:\s\+us"

if [ $? -eq 0 ]
then
    echo "US"
else
    echo "FI"
fi
