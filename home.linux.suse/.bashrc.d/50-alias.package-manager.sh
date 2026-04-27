alias "zp-tup"="\
zypper refresh \
&& zypper --no-refresh dist-upgrade \
&& zypper --no-refresh install-new-recommends --no-recommends \
&& zypper --no-refresh locks --matches \
&& zypper --no-refresh install-new-recommends --dry-run\
"

alias "zp-rm"="zypper remove --clean-deps"
alias "pkg-ls-stray"="zypper --no-refresh packages --orphaned --unneeded"

alias "zpnr"="zypper --no-refresh"


if [ "${EUID}" -ne 0 ] ; then

alias "zp-tup"="\
sudo zypper refresh \
&& sudo zypper --no-refresh dist-upgrade \
&& sudo zypper --no-refresh install-new-recommends --no-recommends \
&& sudo zypper --no-refresh locks --matches \
&& sudo zypper --no-refresh install-new-recommends --dry-run\
"

fi
