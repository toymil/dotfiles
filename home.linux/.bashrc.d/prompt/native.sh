dotfiles__set_prompt() {
# `\[` - begin sequence of non-printing characters
# `\]` - end sequence of non-printing characters
# used for bash to correctly calculates the size of the prompt
bnp="\["
enp="\]"

b_title="${bnp}\e]0;"
e_title="\a${enp}"
b_command="\$("
e_command=")"

# more information: https://en.wikipedia.org/wiki/ANSI_escape_code
# color sequence format:`[<PREFIX>];[<COLOR>];[<TEXT DECORATION>]`
#   prefix 256 colors foreground: `38;5`
#   prefix 256 colors background: `48;5`
#   decoration bold: `1`
#   decoration underline: `4`
bcs="${bnp}\e["  # begin control sequence
ecs="m${enp}"  # end control sequence
reset_color="${bcs}0${ecs}"

# git
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose name"
export GIT_PS1_STATESEPARATOR=" | "
export GIT_PS1_SHOWCOLORHINTS=1

command_number="\#"
date_time="${b_command}date +'%Y-%m-%d %a %H:%M:%S %:z'${e_command}"
directory="\w"
git_info_line="${b_command}__git_ps1 '(%s) '${e_command}"
hostname="\h"
terminal="\l"
username="\u"


# normal prompt
title="\
${b_title}\
${username}@${hostname} {${terminal}} [${directory}]\
${e_title}\
"

line_1="\
${reset_color}\n\
${bcs}38;5;213;1${ecs}> \
${bcs}38;5;81${ecs}${username} \
${bcs}38;5;7${ecs}@ \
${bcs}38;5;84${ecs}${hostname} \
${reset_color}${bcs}38;5;7${ecs}{${terminal}} \
${bcs}38;5;15${ecs}[${date_time}] \
${bcs}38;5;7${ecs}In \
${bcs}38;5;15${ecs}[${command_number}] \
${bcs}38;5;7${ecs}:\
${reset_color}\n\
"
line_2="\
${bcs}38;5;213;1${ecs}- \
${reset_color}${bcs}38;5;229${ecs}${directory}\
${reset_color}\n\
"
line_2_with_git="\
${bcs}38;5;213;1${ecs}- \
${reset_color}${bcs}1${ecs}${git_info_line}\
${reset_color}${bcs}38;5;229${ecs}${directory}\
${reset_color}\n\
"
line_3="\
${bcs}38;5;202;1${ecs}\\$ \
${reset_color}${bcs}38;5;253${ecs}\
"

prompt_normal="${title}${line_1}${line_2}${line_3}"
prompt_normal_with_git="${title}${line_1}${line_2_with_git}${line_3}"


# demo prompt
date_time_demo="${b_command}date --utc +'%Y-%m-%d %H:%M Z'${e_command}"
title_demo="${b_title}# DEMO MODE #${e_title}"

line_1_demo="\
${reset_color}\n\
${bcs}38;5;213;1${ecs}> \
${reset_color}${bcs}38;5;15${ecs}[${date_time_demo}] \
${bcs}38;5;7${ecs}In \
${bcs}38;5;15${ecs}[${command_number}] \
${bcs}38;5;7${ecs}:\
${reset_color}\n\
"

prompt_demo="${title_demo}${line_1_demo}${line_3}"


# set prompt
export PS1="${prompt_normal_with_git}"
alias "prompt_normal"="export PS1=\"\${prompt_normal}\""
alias "prompt_normal_with_git"="export PS1=\"\${prompt_normal_with_git}\""
alias "prompt_demo"="export PS1=\"\${prompt_demo}\""


}
dotfiles__set_prompt
unset -f dotfiles__set_prompt
