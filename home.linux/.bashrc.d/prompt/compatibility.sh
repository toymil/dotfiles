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

local styled_user="${rst}${bcs}1;${c24}131;165;152${ecs}${user}${rst}"
local styled_host="${rst}${bcs}1;${c24}184;187;38${ecs}${host}${rst}"
local styled_path="${rst}${bcs}${c24}213;196;161${ecs}${path}${rst}"
local styled_status="${rst}${bcs}1;${c24}250;189;47${ecs}${status}${rst}"


############################### construct prompt ###############################
local title="${b_title}${user} @ ${host} : [ ${path} ]${e_title}"

local line_1="${rst}\
${styled_status}\
${bcs}${c24}124;111;100${ecs}>${rst}\
 ${styled_user} \
${bcs}${c24}213;196;161${ecs}@${rst}\
 ${styled_host}\
"
local line_2="${rst}\
${bcs}${c24}124;111;100${ecs}-${rst} \
${styled_path}\
"
local line_3="${rst}\
${bcs}1;${c24}251;73;52${ecs}\\\$${rst} \
"

dotfiles__prompt="${title}\n${line_1}\n${line_2}\n${line_3}"


################################## set prompt ##################################
export PS1="${dotfiles__prompt}"


}
dotfiles__set_prompt
unset -f dotfiles__set_prompt
