# "
# The first word of each simple command, if unquoted, is checked to see if it
# has an alias. ... If the last character of the alias value is a blank, then
# the next command word following the alias is also checked for alias expansion.
# " -- https://www.gnu.org/software/bash/manual/html_node/Aliases.html
# Therefore, to make alias work after sudo, you need the following alias:
alias "sudo"="sudo "
alias "sudop"="sudo --preserve-env='http_proxy,https_proxy' "

#===========================================================
#|          modernize/customize `ls` and `tree`           ||

time_style_minute="+\
%Y-%m-%d %H %:::z
--%m-%d %H:%M %:::z\
"
time_style_second="+\
%Y-%m-%d %H:%M:%S %:z
   --%m-%d %H:%M:%S %:z\
"
time_style_millisecond="+\
%Y-%m-%d %H:%M:%S.%3f %::z\
"

ls_base="ls \
--almost-all \
--color=auto \
--classify=auto \
--group-directories-first\
"

ls_grid="${ls_base} \
-C\
"
ls_single="${ls_base} \
-1\
"

ls_long_base="${ls_base} \
-l \
--human-readable \
--literal\
"
ls_long="${ls_long_base} \
--no-group \
--time-style='${time_style_minute}'\
"
ls_long_long="${ls_long_base} \
--all \
--inode \
--context \
--time-style='${time_style_second}'\
"

alias   "l"="LC_COLLATE=C.UTF-8 ${ls_grid}"
alias  "l1"="LC_COLLATE=C.UTF-8 ${ls_single}"
alias  "ll"="LC_COLLATE=C.UTF-8 ${ls_long}"
alias "lll"="LC_COLLATE=C.UTF-8 ${ls_long_long}"

alias "lle"="LC_COLLATE=en_US.utf8 ${ls_long}"
alias "llz"="LC_COLLATE=zh_CN.utf8 ${ls_long}"

alias  "ct"="LC_COLLATE=C.UTF-8 tree -aFC --dirsfirst"
alias "ctp"="ct -fpugi"
alias "cts"="ct -sh --du"

if [ -x "$(command -v eza)" ] ; then

export EZA_MIN_LUMINANCE=65
eza_foundation="eza \
--icons=never \
--color=auto \
--color-scale=all \
--color-scale-mode=gradient \
--classify=auto \
--all \
--sort=name\
"

eza_base="${eza_foundation} \
--group-directories-first\
"

eza_grid="${eza_base} \
--grid\
"
eza_single="${eza_base} \
--oneline\
"

eza_long="${eza_base} \
--long \
--binary \
--no-quotes\
"
eza_long_long="${eza_long} \
--header \
--inode \
--octal-permissions \
--group \
--mounts\
"
eza_long_long_long="${eza_long_long} \
--links \
--flags \
--context \
--extended\
"

alias    "e"="${eza_grid}"
alias   "ee"="${eza_single}"
alias   "el"="${eza_long} --time-style='${time_style_minute}'"
alias  "ell"="${eza_long_long} --time-style='${time_style_second}'"
alias "elll"="${eza_long_long_long} --time-style='${time_style_millisecond}'"

eza_tree="${eza_foundation} \
--group-directories-last \
--tree \
--no-quotes\
"

eza_tree_long="${eza_tree} \
--long \
--binary \
--no-user \
--time-style='${time_style_second}'\
"
eza_tree_permissions="${eza_tree} \
--long \
--octal-permissions \
--group \
--no-filesize \
--no-time\
"
eza_tree_size="${eza_tree} \
--long \
--binary \
--no-permissions \
--no-user \
--no-time\
"

eza_tree_git="${eza_tree} \
--long \
--no-permissions \
--no-filesize \
--no-user \
--no-time \
--git\
"
eza_tree_git_ignore="${eza_tree_git} \
--git-ignore\
"

alias  "et"="${eza_tree}"
alias "etl"="${eza_tree_long}"
alias "etp"="${eza_tree_permissions}"
alias "ets"="${eza_tree_size}"

alias  "etg"="${eza_tree_git}"
alias "etgi"="${eza_tree_git_ignore}"

alias "et1"="et -L 1"
alias "et2"="et -L 2"
alias "et3"="et -L 3"

alias "etl1"="etl -L 1"
alias "etl2"="etl -L 2"
alias "etl3"="etl -L 3"

alias "etp1"="etp -L 1"
alias "etp2"="etp -L 2"
alias "etp3"="etp -L 3"

alias "etg1"="etg -L 1"
alias "etg2"="etg -L 2"
alias "etg3"="etg -L 3"

fi

#===========================================================
#|               modernize/customize `cat`                ||

if [ -x "$(command -v batcat)" ] ; then
    alias "bat"="batcat"
fi

if command -v bat &> /dev/null ; then
    alias  "cat"="bat -p"
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
#|           modernize/customize `cp` and `scp`           ||

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

# flatpak update
alias "flat-update"="flatpak --user update"
alias "flat-clean"="flatpak --user repair && flatpak --user uninstall --unused"

#===========================================================
#|                   gpg q.o.l. aliases                   ||

gpg_list_base="\
gpg \
--verbose \
--keyid-format 0xlong \
--with-fingerprint \
--with-subkey-fingerprint\
"

alias "gpgl"="${gpg_list_base} --list-keys"
alias "gpgls"="${gpg_list_base} --list-secret-keys"

#===========================================================
#|                     q.o.l. aliases                     ||

alias "cs"="scrcpy --video-bit-rate=8M --audio-bit-rate=128K"
alias "cso"="cs --turn-screen-off"
alias "csa"="scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off"

alias "tmux"="tmux -u"

alias "mkv"="mkdir -vp"

alias "cpv"="cp -vri --preserve=timestamps"
alias "mvv"="mv -vi"
alias "mvs"="mv -vi --exchange"

alias "rmv"="rm -vrI"
alias "rmf"="rm -vrf"
alias "rmi"="rm -ri"

if [ -x "$(command -v nvim)" ] ; then
    alias "vim"="nvim"
    alias  "nv"="nvim"
    alias "nvr"="nvim -R"
fi

if [ -x "$(command -v zellij)" ] ; then
    alias "zj"="zellij"
fi

alias    ".."="cd ../"
alias   "..."="cd ../../"
alias  "...."="cd ../../../"
alias "....."="cd ../../../../"
export HISTIGNORE="${HISTIGNORE}:..:...:....:....."

#===========================================================
#|                 functionality aliases                  ||

# show local git repositories
alias "show-repo"="cf -s -t d '.git' /"

# delete vim undo history files
alias "delete-vimundo"="cf -s -t f '.*.un~' ./ -X rm -i {} \;"
alias "delete-vimundo-root"="cf -s -t f '.*.un~' / -X rm -i {} \;"

# delete LaTeX compile auxiliary files
alias "delete-latexaux"="cf --regex -s -t f '^.+\.(synctex\.gz|xdv)$' ./ -X rm -i {} \;"
alias "delete-latexaux-root"="cf --regex -s -t f '^.+\.(synctex\.gz|xdv)$' / -X rm -i {} \;"

# kill vscode server (for vscode remote ssh)
# see: https://code.visualstudio.com/docs/remote/troubleshooting#_cleaning-up-the-vs-code-server-on-the-remote
alias "kill-vscode-server"="kill -9 \$(ps aux | grep vscode-server | grep \$USER | grep -v grep | awk '{print \$2}')"
