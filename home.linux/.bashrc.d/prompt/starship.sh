#!/usr/bin/env bash

eval "$(starship init bash)"

function set_title() {
    local path_full
    local path_last_component

    path_full=$PWD

    path_last_component=${path_full##*/}
    path_last_component=${path_last_component:-/}

    echo -ne "\e]0; $USER @ $HOSTNAME : [ $path_last_component ]( $path_full ) \a"
}
starship_precmd_user_func="set_title"
