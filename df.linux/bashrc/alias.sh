#!/usr/bin/env bash

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
alias  "l1"="LC_COLLATE=C.UTF-8 ${l} -1"
alias  "ll"="LC_COLLATE=C.UTF-8 ${ll}"
alias "lll"="LC_COLLATE=C.UTF-8 ${lll}"
alias "lle"="LC_COLLATE=en_US.utf8 ${ll}"
alias "llz"="LC_COLLATE=zh_CN.utf8 ${ll}"

alias  "ct"="LC_COLLATE=C.UTF-8 tree -aFC --dirsfirst"
alias "ctp"="ct -fpugi"
alias "cts"="ct -sh --du"

if [ -x "$(command -v eza)" ] ; then

alias "e"="eza \
--all \
--sort=name \
--group-directories-first \
--classify \
--color=automatic \
--color-scale \
--icons=never\
"

alias "e1"="e \
--oneline \
--no-quotes\
"

# TODO: eza doesn't support setting different time
# style format string for recent/non-recent files
# (yet).
alias "el"="e \
--long \
--no-quotes \
--binary \
--time-style='+%Y-%m-%d %H:%M %:::z'\
"
alias "ell"="el \
--all \
--header \
--group \
--links \
--mounts \
--time-style='+%Y-%m-%d %H:%M:%S %:z'\
"
alias "elll"="ell \
--inode \
--blocksize \
--extended \
--context \
--time-style='+%Y-%m-%d %H:%M:%S.%3f %::z'\
"

alias "et"="e \
--tree \
--no-quotes\
"
alias "etl"="et \
--long \
--binary \
--group \
--no-time\
"
alias "etl1"="etl -L 1"
alias "etl2"="etl -L 2"
alias "etl3"="etl -L 3"

fi

#===========================================================
#|               modernize/customize `cat`                ||

if [ -x "$(command -v batcat)" ] ; then
    alias "bat"="batcat"
fi

if command -v bat &> /dev/null ; then
    alias "cat"="bat -p"
    alias "catp"="bat -pp"  # cat plain
    alias "catf"="bat --style=header,grid,numbers --wrap=never"  # cat fancy
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
#|                'update' q.o.l. aliases                 ||

# apt update
alias "apt-update"="\
apt update \
&& apt upgrade \
&& apt full-upgrade \
&& apt install -f\
"
alias "apt-clean"="\
apt autoremove \
&& apt clean \
&& dpkg -l | grep '^rc' | awk '{print \$2}' | xargs dpkg --purge\
"

# flatpak update
alias "flat-update"="flatpak --user update"
alias "flat-clean"="flatpak --user repair && flatpak --user uninstall --unused"

# conda update
alias "conda-update"="conda update --all"
alias "conda-clean"="conda clean --all"

# vim update
alias "vim-update"="vim +PlugUpdate +PlugUpgrade +qa"

#===========================================================
#|                     q.o.l. aliases                     ||

alias "cs"="scrcpy --video-bit-rate=8M --audio-bit-rate=128K"
alias "cso"="cs --turn-screen-off"
alias "csa"="scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off"

alias "tmux"="tmux -u"

alias "mkv"="mkdir -vp"

alias "cpv"="cp -vri"
alias "mvv"="mv -vi"

alias "rmv"="rm -vrI"
alias "rmf"="rm -vrf"
alias "rmi"="rm -ri"

if [ -x "$(command -v nvim)" ] ; then
    alias "nv"="nvim"
fi

if [ -x "$(command -v zellij)" ] ; then
    alias "zj"="zellij"
fi

#===========================================================
#|                 functionality aliases                  ||

# show local git repositories
alias "show-repo"="cf -s -t d '.git' /"

# show leftover configuration files
alias "show-old-conf"="find /etc -name '*.dpkg-*' -o -name '*.ucf-*' -o -name '*.merge-error'"

# delete vim undo history files
alias "delete-vimundo"="cf -s -t f '.*.un~' ./ -X rm -i {} \;"
alias "delete-vimundo-root"="cf -s -t f '.*.un~' / -X rm -i {} \;"

# delete LaTeX compile auxiliary files
alias "delete-latexaux"="cf --regex -s -t f '^.+\.(synctex\.gz|xdv)$' ./ -X rm -i {} \;"
alias "delete-latexaux-root"="cf --regex -s -t f '^.+\.(synctex\.gz|xdv)$' / -X rm -i {} \;"

# alias to get windows host ip in wsl (whi = wsl host ip)
alias "whi"="cat /etc/resolv.conf | grep nameserver | awk '{ print \$2 }'"
