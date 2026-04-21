dotfiles__set_prompt() {
# `\[` - begin sequence of non-printing characters
# `\]` - end sequence of non-printing characters
# used for bash to correctly calculates the size of the prompt
local bnp="\["
local enp="\]"

local b_title="${bnp}\e]0;"
local e_title="\a${enp}"

# more information: https://en.wikipedia.org/wiki/ANSI_escape_code
# color sequence format:`[<PREFIX>];[<COLOR>];[<TEXT DECORATION>]`
#   prefix 256 colors foreground: `38;5`
#   prefix 256 colors background: `48;5`
#   decoration bold: `1`
#   decoration underline: `4`
local bcs="${bnp}\e["  # begin control sequence
local ecs="m${enp}"    # end control sequence
local reset_color="${bcs}0${ecs}"


user="\u"
host="\h"
path="\w"
status="\$?"


############################### construct prompt ###############################
title="${b_title}${user} @ ${host} : [ ${path} ]${e_title}"

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

dotfiles_prompt="${title}${line_1}${line_2}${line_3}"


################################## set prompt ##################################
export PS1="${dotfiles_prompt}"


}
dotfiles__set_prompt
unset -f dotfiles__set_prompt
