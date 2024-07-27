#!/usr/bin/env bash

#===========================================================
#|                    set bash history                    ||

export HISTCONTROL=""
export HISTIGNORE="exit:clear"
export HISTTIMEFORMAT="[%F %T %z]  "
shopt -s histappend
export PROMPT_COMMAND+=('history -a')
