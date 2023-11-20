#!/usr/bin/env bash

eval "$(starship init bash)"

function set_title() {
    echo -ne "\e]0; $USER @ $HOSTNAME : $PWD \a"
}
starship_precmd_user_func="set_title"
