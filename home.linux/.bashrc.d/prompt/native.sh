dotfiles__set_prompt() {
# `\[`  : begin sequence of non-printing characters
# `\]`  :   end sequence of non-printing characters
# used for bash to correctly calculate the size of the prompt
local bnp="\["
local enp="\]"

local b_title="${bnp}\e]0;"
local e_title="\a${enp}"

# for more information see: https://en.wikipedia.org/wiki/ANSI_escape_code
# Select Graphic Rendition (SGR):
#   `1`              : bold or intense color
#   `38;<color>`     : foreground color
#   `48;<color>`     : background color
# color:
#   `5;<0-255>`      :  8bit color
#   `2;<r>;<g>;<b>`  : 24bit color
# delimit multiple SGR in the same control sequence by semicolon
local bcs="${bnp}\e["      # begin control sequence
local ecs="m${enp}"        #   end control sequence
local c24="38;2;"          # SGR 24bit color, follow by `<r>;<g>;<b>`
local rst="${bcs}0${ecs}"  # reset SGR


local user="\u"
local host="\h"
local path="\w"
local status="\$?"
local date_time="\$(date +'--%m-%d %H:%M:%S %:z')"
local git_info_line="\$(__git_ps1 '(%s) ')"

local styled_user=""
local styled_host=""
local styled_path=""
local styled_status=""
local styled_date_time=""

# git
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose name"
export GIT_PS1_STATESEPARATOR=" | "
export GIT_PS1_SHOWCOLORHINTS=1


############################### construct prompt ###############################
title="${b_title}${user} @ ${host} : [ ${path} ]${e_title}"

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

dotfiles_prompt="${title}${line_1}${line_2}${line_3}"
dotfiles_prompt_with_git="${title}${line_1}${line_2_with_git}${line_3}"


################################## set prompt ##################################
export PS1="${dotfiles_prompt_with_git}"


}
dotfiles__set_prompt
unset -f dotfiles__set_prompt
