#!/bin/sh

layout=$(setxkbmap -query | grep layout | awk '{print $2}')
if [ $layout = "us" ]; then
  setxkbmap -layout br -variant abnt2
  echo 'Keyboard layout set to PT-BR'
else
  setxkbmap -layout us -variant intl
  echo 'Keyboard layout set to US'
fi

setxkbmap -option caps:swapescape
