#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap fi || setxkbmap us

pkill -RTMIN+10 i3blocks

