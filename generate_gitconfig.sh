#!/bin/bash

git config --global user.name "Leonardo Diniz"
git config --global push.autoSetupRemote true
git config --global alias.s "!git status -s"
git config --global alias.l "!git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(green)%cn, %C(cyan)%cr'"

if [ -f /etc/os-release ]; then
	. /etc/os-release
	case $NAME in
	"Arch Linux")
		git config --global user.signingkey "AB2C228810A1F5EE"
		git config --global user.email "leonardodiber@gmail.com"
		git config --global commit.gpgsign true
		;;

	"Ubuntu")
		git config --global user.email "leonardo.diniz@dito.com.br"
		;;
	esac
fi
