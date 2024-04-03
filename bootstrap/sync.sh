#!/usr/bin/env zsh
# ZDOTDIR=/home/leotsgo/
# SHELL=/usr/bin/zsh
# */1 * * * * /home/leotsgo/bootstrap/sync.sh
source /home/leotsgo/.zshrc
git -C /home/leotsgo/sb pull
git -C /home/leotsgo/sb add --all
git -C /home/leotsgo/sb commit -m "manual backup: $(date '+%Y-%m-%d %H:%M:%S')"
git -C /home/leotsgo/sb push
