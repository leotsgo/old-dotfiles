#!/bin/bash
if [ -f /etc/os-release ]; then
  . /etc/os-release
  case $NAME in
    "Arch Linux")
        IS_WORK=0
        ;;

    "Ubuntu")
        IS_WORK=1
        ;;
  esac
fi

git config --global user.name "Leonardo Diniz"
git config --global push.autoSetupRemote true
git config --global alias.s "!git status -s"
git config --global alias.l "!git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(green)%cn, %C(cyan)%cr'"


case $IS_WORK in 
  "0")
    git config --global user.signingkey "AB2C228810A1F5EE";
    git config --global user.email "leonardodiber@gmail.com"
    git config --global commit.gpgsign true;
    ;;
  "1")
    git config --global user.email "leonardo.diniz@dito.com.br"
    ;;
esac
