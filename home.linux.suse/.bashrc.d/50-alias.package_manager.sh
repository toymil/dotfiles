#!/usr/bin/env bash

alias "zp-tup"="\
zypper refresh \
&& zypper --no-refresh dist-upgrade \
&& zypper --no-refresh install-new-recommends --no-recommends \
&& zypper --no-refresh install-new-recommends --dry-run\
"

alias "zp-rm"="zypper remove --clean-deps"
alias "pkg-ls-stray"="zypper --no-refresh packages --orphaned --unneeded"
