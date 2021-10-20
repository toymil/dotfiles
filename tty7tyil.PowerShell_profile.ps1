function Prompt {"`n" + "> ${env:UserName} @ ${env:ComputerName} [$(Get-Date -UFormat '%Y-%m-%d %H:%M:%S %Z')] In [$(@(Get-History).Count + 1)] :`n" + "- $($ExecutionContext.SessionState.Path.CurrentLocation)`n" + $(if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {"# "} else {"$ "})}

Set-PSReadLineKeyHandler -Key Tab -Function Complete

function e {lsd -AF --color=always --group-dirs=first --icon=never @Args}
function el {e -hl --blocks='permission,size,user,date,name' --date='+%Y-%m-%d %H:%M %z' @Args}
function ell {e -ahl --blocks='inode,permission,size,user,group,date,name' --date='+%Y-%m-%d %H:%M:%S %z' @Args}
function et {e --tree @Args}

function cs {scrcpy --bit-rate 8m --stay-awake @Args}
function cso {cs --turn-screen-off @Args}
