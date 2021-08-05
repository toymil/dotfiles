################################################################################
#                            CUSTOMIZE BASH PROMPT                             #
################################################################################

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
date_time="${b_command}date +'%Y-%m-%d %H:%M:%S %:z'${e_command}"
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
${reset_color}${bcs}1${ecs}${git_info_line}\
${reset_color}${bcs}38;5;229${ecs}${directory}\
${reset_color}\n\
"
line_3="\
${bcs}38;5;202;1${ecs}\\$ \
${reset_color}${bcs}38;5;253${ecs}\
"

normal_prompt="${title}${line_1}${line_2}${line_3}"

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

demo_prompt="${title_demo}${line_1_demo}${line_3}"

# set prompt
export PS1="${normal_prompt}"
alias "normal_prompt"="export PS1=\"\${normal_prompt}\""
alias "demo_prompt"="export PS1=\"\${demo_prompt}\""


################################################################################
#                                BASH BEHAVIOUR                                #
################################################################################

# includes filenames beginning with a '.' in the results of filename expansion
shopt -s dotglob


################################################################################
#                                   ALIASES                                    #
################################################################################

# "
# The first word of each simple command, if unquoted, is checked to see if it
# has an alias. ... If the last character of the alias value is a blank, then
# the next command word following the alias is also checked for alias expansion.
# " - quote from https://www.gnu.org/software/bash/manual/bash.html#Aliases
# Therefore, to make alias work after sudo, you need the following alias:
alias "sudo"="sudo "

#===========================================================
#|          modernize/customize `ls` et. `tree`           ||

ls_time_style_short="+\
%Y-%m-%d %H %:::z
--%m-%d %H:%M %:::z\
"
ls_time_style_long="+\
%Y-%m-%d %H:%M:%S %:z
   --%m-%d %H:%M:%S %:z\
"
ls_base="\
ls \
-AF \
--color=always \
--group-directories-first\
"
l="${ls_base} -N"
ll="${ls_base} -GhlN --time-style='${ls_time_style_short}'"
lll="${ls_base} -ahil --time-style='${ls_time_style_long}'"

alias   "l"="LC_COLLATE=C.UTF-8 ${l}"
alias  "ll"="LC_COLLATE=C.UTF-8 ${ll}"
alias "lll"="LC_COLLATE=C.UTF-8 ${lll}"
alias "lle"="LC_COLLATE=en_US.utf8 ${ll}"
alias "llz"="LC_COLLATE=zh_CN.utf8 ${ll}"

alias  "ct"="LC_COLLATE=C.UTF-8 tree -aFC --dirsfirst"
alias "ctp"="ct -fpugi"
alias "cts"="ct -sh --du"

if [ -x "$(command -v exa)" ] ; then
    alias   "e"="exa -aF --color=always --group-directories-first"
    # exa does not support the `+FORMAT` time style yet (TODO)
    alias  "el"="e -l --color-scale --time-style=iso"
    alias "ell"="e -agHil --color-scale --time-style=long-iso"
    alias  "et"="e -T"
    alias "etl"="et -gl --color-scale --no-time"
fi

#===========================================================
#|               modernize/customize `cat`                ||

if [ -x "$(command -v batcat)" ] ; then
    alias "bat"="batcat"
fi

if command -v bat &> /dev/null ; then
    alias "cat"="bat -p"
fi

#===========================================================
#|               modernize/customize `find`               ||

if [ -x "$(command -v fdfind)" ] ; then
    alias "fd"="fdfind"
fi

if command -v fd &> /dev/null ; then
    alias "cf"="fd -HIg"
fi

#===========================================================
#|           modernize/customize `cp` et. `scp`           ||

# rsync
#   --verbose
#   --human-readable
#   --progress              will output each individual directories then the
#                           files within (--verbose also does this), with
#                           per-file progress
#   --info=progress2        1: per-file progress (output for each individual
#                           files);  2: total transfer progress
#   --info=stats            statistics at end of run (has 3 levels, --verbose
#                           does level 1)
#   --checksum
#
#   --archive
#       -rlptgoD
#           --recursive
#           --links
#           --perms
#           --times
#           --group
#           --owner
#           -D
#               --devices
#               --specials
#   --hard-links            preserve hard links
#   --acls                  preserve ACLs (implies --perms)
#   --xattrs                preserve extended attributes
#
#   --whole-file            copy files whole (w/o delta-xfer algorithm)
#   --preallocate           allocate dest files before writing them
#   --partial               keep partially transferred files
#   --compress
#
#   --inplace               (implies --partial)
#   --update                skip files that are newer on the receiver
#   --existing              skip creating new files on receiver
#   --ignore-existing       skip updating files that exist on receiver
#
#   --safe-links            ignore symlinks that point outside the tree
#   --keep-dirlinks         treat symlinked dir on receiver as dir
#
#   --chmod=D0755,F0644
#   --chown=USER:GROUP

alias "crs"="\
rsync \
--human-readable \
--info=progress2 \
--info=stats \
\
--archive \
--no-devices \
--no-specials \
\
--whole-file \
--preallocate \
--no-compress\
"

alias "crs-remote"="\
crs \
--verbose \
--info=skip \
--safe-links \
--no-perms \
--no-group \
--no-owner\
"

alias "crs-remote-644"="crs-remote --chmod=D0755,F0644"

#===========================================================
#|                    customize `dig`                     ||

alias "cdig"="dig +all +nocookie"
alias "cdigs"="digc +short"

#===========================================================
#|                'update' q.o.l. aliases                 ||

# apt update
alias "apt-update"="\
apt update \
&& apt -y upgrade \
&& apt -y full-upgrade \
&& apt -y install -f\
"
alias "apt-clean"="\
apt autoremove \
&& apt clean \
&& dpkg -l | grep '^rc' | awk '{print \$2}' | xargs dpkg --purge\
"

# conda update
alias "conda-update"="conda update --all"
alias "conda-clean"="conda clean --all"

# vim update
alias "vim-update"="vim +PluginUpdate +qall"

#===========================================================
#|                 functionality aliases                  ||

# show local git repositories
alias "show-repo"="cf -s -t d '.git' /"

# delete vim undo history files
alias "delete-vimundo"="cf -s -t f '.*.un~' / -X rm -i {} \;"

# alias to get windows host ip in wsl (whi = wsl host ip)
alias "whi"="cat /etc/resolv.conf | grep nameserver | awk '{ print \$2 }'"


################################################################################
#                               CUSTOM FUNCTION                                #
################################################################################

