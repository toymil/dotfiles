################################################################################
#                             ENVIRONMENT VARIABLE                             #
################################################################################

# set default editor to `vim`
export EDITOR=vim
export VISUAL="${EDITOR}"
export SUDO_EDITOR="${EDITOR}"


# ################################################################################
# #                                BASH BEHAVIOUR                                #
# ################################################################################
# 
# # includes filenames beginning with a '.' in the results of filename expansion
# shopt -s dotglob
# 
# #===========================================================
# #|                    set bash history                    ||
# 
# export HISTTIMEFORMAT="[%F %T %z]  "


################################################################################
#                                   ALIASES                                    #
################################################################################

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

#===========================================================
#|           modernize/customize `cp` et. `scp`           ||

alias "crs-dae"="rsync --daemon --no-detach"

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
alias "cdigs"="cdig +short"

#===========================================================
#|                     q.o.l. aliases                     ||

alias "tmux"="tmux -u"

alias "mkv"="mkdir -vp"

alias "cpv"="cp -vri"
alias "mvv"="mv -vi"

alias "rmv"="rm -vrI"
alias "rmf"="rm -vrfI"
alias "rmi"="rm -ri"
