dotfiles__ls() {
local ls_base="ls \
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

local ls_long_base="${ls_base} \
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

alias   l="LC_COLLATE=C.UTF-8 ${ls_grid}"
alias  l1="LC_COLLATE=C.UTF-8 ${ls_single}"
alias  ll="LC_COLLATE=C.UTF-8 ${ls_long}"
alias lll="LC_COLLATE=C.UTF-8 ${ls_long_long}"

alias lle="LC_COLLATE=en_US.utf8 ${ls_long}"
alias llz="LC_COLLATE=zh_CN.utf8 ${ls_long}"

unset -f dotfiles__ls
}


dotfiles__tree() {
if [ ! -x "$(command -v tree)" ] ; then return ; fi

local tree_base="LC_COLLATE=C.UTF-8 tree -aFC --dirsfirst"

alias  ct="${tree_base}"
alias ctp="${tree_base} -fpugi"
alias cts="${tree_base} -sh --du"

unset -f dotfiles__tree
}


dotfiles__eza() {
if [ ! -x "$(command -v eza)" ] ; then return ; fi

export EZA_MIN_LUMINANCE=65
local eza_foundation="eza \
--icons=never \
--color=auto \
--color-scale=all \
--color-scale-mode=gradient \
--classify=auto \
--all \
--sort=name\
"


local eza_base="${eza_foundation} \
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

alias    e="${eza_grid}"
alias   ee="${eza_single}"
alias   el="${eza_long} --time-style='${time_style_minute}'"
alias  ell="${eza_long_long} --time-style='${time_style_second}'"
alias elll="${eza_long_long_long} --time-style='${time_style_millisecond}'"


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

alias  et="${eza_tree}"
alias etl="${eza_tree_long}"
alias etp="${eza_tree_permissions}"
alias ets="${eza_tree_size}"

alias  etg="${eza_tree_git}"
alias etgi="${eza_tree_git_ignore}"

alias et1="et -L 1"
alias et2="et -L 2"
alias et3="et -L 3"

alias etl1="etl -L 1"
alias etl2="etl -L 2"
alias etl3="etl -L 3"

alias etp1="etp -L 1"
alias etp2="etp -L 2"
alias etp3="etp -L 3"

alias etg1="etg -L 1"
alias etg2="etg -L 2"
alias etg3="etg -L 3"

unset -f dotfiles__eza
}


dotfiles__file_ops() {
alias mkv="mkdir -vp"

alias cpv="cp -vri --preserve=timestamps"
alias mvv="mv -vi"
alias mvs="mv -vi --exchange"

alias rmv="rm -vrI"
alias rmf="rm -vrf"
alias rmi="rm -ri"

alias    ..="cd ../"
alias   ...="cd ../../"
alias  ....="cd ../../../"
alias .....="cd ../../../../"
export HISTIGNORE="${HISTIGNORE}:..:...:....:....."

unset -f dotfiles__file_ops
}


dotfiles__bat() {
local exe_name
if [ -x "$(command -v bat)" ] ; then
    exe_name="bat"
elif [ -x "$(command -v batcat)" ] ; then
    exe_name="batcat"
else
    return
fi

alias  cat="${exe_name} -pp"  # no decorations, no paging
alias catp="${exe_name} -p"   # no decorations, auto paging
alias catf="${exe_name} --style=header,grid,numbers --wrap=never"

unset -f dotfiles__bat
}


dotfiles__fd() {
local exe_name
if [ -x "$(command -v fd)" ] ; then
    exe_name="fd"
elif [ -x "$(command -v fdfind)" ] ; then
    exe_name="fdfind"
else
    return
fi

alias cf="${exe_name} --hidden --no-ignore --ignore-case --glob"

unset -f dotfiles__fd
}


dotfiles__rsync() {
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

local rsync_base="rsync \
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
local rsync_remote="${rsync_base} \
--verbose \
--info=skip \
--safe-links \
--no-perms \
--no-group \
--no-owner\
"

alias crs-dae="rsync --daemon --no-detach"
alias crs="${rsync_base}"
alias crs-remote="${rsync_remote}"
alias crs-remote-644="${rsync_remote} --chmod=D0755,F0644"

unset -f dotfiles__rsync
}


dotfiles__misc() {
# serve rust docs with local http server
alias use-rust-docs='cd "$(dirname "$(rustup +nightly doc --path)")" && python3 -m http.server 4725'

# show local git repositories
alias find-repos="cf -s -t d '.git' /"

# delete vim undo history files
alias remove-vimundos="cf -s -t f '.*.un~' ./ -X rm -i {} \;"

# delete LaTeX compile auxiliary files
alias remove-latexauxes="cf --regex -s -t f '^.+\.(synctex\.gz|xdv)$' ./ -X rm -i {} \;"

# kill vscode server (for vscode remote ssh)
# see: https://code.visualstudio.com/docs/remote/troubleshooting#_cleaning-up-the-vs-code-server-on-the-remote
alias kill-vscode-server="kill -9 \$(ps aux | grep vscode-server | grep \$USER | grep -v grep | awk '{print \$2}')"

unset -f dotfiles__misc
}


dotfiles__main() {
# "
# The first word of each simple command, if unquoted, is checked to see if it
# has an alias. ... If the last character of the alias value is a blank, then
# the next command word following the alias is also checked for alias expansion.
# " -- https://www.gnu.org/software/bash/manual/html_node/Aliases.html
# Therefore, to make alias work after sudo, you need the following alias:
alias sudo="sudo "
alias sudop="sudo --preserve-env='http_proxy,https_proxy' "


local time_style_minute="+\
%Y-%m-%d %H %:::z
--%m-%d %H:%M %:::z\
"
local time_style_second="+\
%Y-%m-%d %H:%M:%S %:z
   --%m-%d %H:%M:%S %:z\
"
local time_style_millisecond="+\
%Y-%m-%d %H:%M:%S.%3f %::z\
"
dotfiles__ls
dotfiles__tree
dotfiles__eza

dotfiles__file_ops


dotfiles__bat
dotfiles__fd
dotfiles__rsync


local dig_base="dig +all +nocookie"
alias  cdig="${dig_base}"
alias cdigs="${dig_base} +short"


local gpg_list_base="gpg \
--verbose \
--keyid-format 0xlong \
--with-fingerprint \
--with-subkey-fingerprint\
"
alias  gpgl="${gpg_list_base} --list-keys"
alias gpgls="${gpg_list_base} --list-secret-keys"


alias cs="scrcpy --video-bit-rate=8M --audio-bit-rate=128K"
alias cso="cs --turn-screen-off"
alias csa="scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off"


if [ -x "$(command -v tmux)" ] ; then
    alias tmux="tmux -u"
fi
if [ -x "$(command -v zellij)" ] ; then
    alias zj="zellij"
fi


alias vimr="vim -R"
alias vimp="vim -R -"
if [ -x "$(command -v nvim)" ] ; then
    alias  nv="nvim"
    alias nvr="nvim -R"
    alias nvp="nvim -R -"
fi


dotfiles__misc


}
dotfiles__main
unset -f dotfiles__main
