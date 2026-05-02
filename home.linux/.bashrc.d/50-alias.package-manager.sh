alias flat-update="flatpak --user update"
alias flat-clean="\
flatpak --user repair \
&& flatpak --user uninstall --unused --delete-data\
"
