#!/usr/bin/env bash

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

alias "pkg-ls-obsolete"="apt list '~o'"
alias "pkg-ls-non-debian"="apt list '?narrow(?installed, ?not(?origin(Debian)))'"
alias "pkg-ls-leftover-config"="find /etc -name '*.dpkg-*' -o -name '*.ucf-*' -o -name '*.merge-error'"

# TODO: find dummy packages with `deborphan` (see debian release note "Upgrades" chapter)
