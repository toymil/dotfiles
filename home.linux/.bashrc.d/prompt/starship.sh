eval "$(starship init bash)"

dotfiles__set_title() {
    local path_full="${PWD}"

    local path_last_component
    path_last_component="${path_full##*/}"
    path_last_component="${path_last_component:-/}"

    echo -ne "\e]0;${USER} @ ${HOSTNAME} : [ ${path_last_component} ]( ${path_full} )\a"
}
starship_precmd_user_func="dotfiles__set_title"
