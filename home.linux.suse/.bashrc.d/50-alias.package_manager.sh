#!/usr/bin/env bash

alias "zp-tup"="\
zypper refresh \
&& zypper dist-upgrade \
&& zypper install-new-recommends --no-recommends\
"

alias "zp-rm"="zypper remove --clean-deps"
alias "pkg-ls-unneeded"="zypper packages --unneeded"

alias "pkg-ls-orphaned"="zypper packages --orphaned"
