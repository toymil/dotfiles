alias zp-tup="\
zypper refresh \
&& zypper --no-refresh dist-upgrade --no-recommends \
&& zypper --no-refresh install-new-recommends --no-recommends \
&& zypper --no-refresh locks --matches \
&& zypper --no-refresh packages --recommended --not-installed-only \
&& zypper --no-refresh install-new-recommends\
"

alias pkg-ls-stray="\
zypper --no-refresh packages --unneeded \
&& zypper --no-refresh packages --orphaned\
"

alias zpnr="zypper --no-refresh"
alias zp-rm="zypper remove --clean-deps"


if [ "${EUID}" -ne 0 ] ; then

alias zp-tup="\
sudo zypper refresh \
&& sudo zypper --no-refresh dist-upgrade --no-recommends \
&& sudo zypper --no-refresh install-new-recommends --no-recommends \
&& sudo zypper --no-refresh locks --matches \
&& sudo zypper --no-refresh packages --recommended --not-installed-only \
&& sudo zypper --no-refresh install-new-recommends\
"

fi
