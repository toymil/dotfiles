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

directory="\w"
hostname="\h"
username="\u"


# normal prompt
title="\
${b_title}\
${username}@${hostname} [${directory}]\
${e_title}\
"

line_1="\
${reset_color}\n\
${bcs}38;5;213;1${ecs}> \
${bcs}38;5;81${ecs}${username} \
${bcs}38;5;7${ecs}@ \
${bcs}38;5;84${ecs}${hostname} \
${reset_color}${bcs}38;5;7${ecs}:\
${reset_color}\n\
"
line_2="\
${bcs}38;5;213;1${ecs}- \
${reset_color}${bcs}38;5;229${ecs}${directory}\
${reset_color}\n\
"
line_3="\
${bcs}38;5;202;1${ecs}\\$ \
${reset_color}${bcs}38;5;253${ecs}\
"

prompt_normal="${title}${line_1}${line_2}${line_3}"


# set prompt
export PS1="${prompt_normal}"
