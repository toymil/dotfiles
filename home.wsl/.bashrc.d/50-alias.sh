# alias to get windows host ip in wsl
# see: https://learn.microsoft.com/en-us/windows/wsl/networking#accessing-windows-networking-apps-from-linux-host-ip
alias whip="ip route show | grep -i default | awk '{ print \$3}'"
