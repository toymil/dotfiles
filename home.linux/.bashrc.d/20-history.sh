dotfiles__histignore_base() {
    export HISTIGNORE="exit:clear"

    export HISTIGNORE="${HISTIGNORE}:reboot:sudo reboot"
    export HISTIGNORE="${HISTIGNORE}:shutdown *:sudo shutdown *"

    export HISTIGNORE="${HISTIGNORE}:history|*:history |*"

    unset -f dotfiles__histignore_base
}


dotfiles__main() {
    ## enable command history
    #set -o history

    export HISTCONTROL=""
    dotfiles__histignore_base
    export HISTTIMEFORMAT="[%F %T %z]  "

    shopt -s histappend
    # append to HISTFILE before each prompt
    export PROMPT_COMMAND+=('history -a')
}
dotfiles__main
unset -f dotfiles__main
