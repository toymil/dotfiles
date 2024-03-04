# alias to get windows host ip in wsl (whi = wsl host ip)
alias "whi"="cat /etc/resolv.conf | grep nameserver | awk '{ print \$2 }'"
