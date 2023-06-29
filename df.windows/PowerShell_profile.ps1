function Prompt { "`n" + "> ${env:UserName} @ ${env:ComputerName} [$(Get-Date -UFormat '%Y-%m-%d %H:%M:%S %Z')] In [$(@(Get-History).Count + 1)] :`n" + "- $($ExecutionContext.SessionState.Path.CurrentLocation)`n" + $(if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { "# " } else { "$ " }) }

Set-PSReadLineKeyHandler -Key Tab -Function Complete

function l { coreutils.exe ls -AF --color=always --group-directories-first -N @Args }
function ll { coreutils.exe ls -AF --color=always --group-directories-first -GhlN --time-style="+%Y-%m-%d %H %:::z" @Args }
function lll { coreutils.exe ls -AF --color=always --group-directories-first -ahil --time-style="+%Y-%m-%d %H:%M:%S %:z" @Args }

function e { lsd -AF --color=always --group-dirs=first --icon=never @Args }
function el { e -hl --blocks='permission,size,user,date,name' --date='+%Y-%m-%d %H:%M %z' @Args }
function ell { e -ahl --blocks='inode,permission,size,user,group,date,name' --date='+%Y-%m-%d %H:%M:%S %z' @Args }
function et { e --tree @Args }

function cs { scrcpy --video-bit-rate=8M --audio-bit-rate=128K @Args }
function cso { cs --turn-screen-off @Args }
function csa { scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off @Args }

function mkv { coreutils.exe mkdir -vp @Args }

function cpv { coreutils.exe cp -vri @Args }
function mvv { coreutils.exe mv -vi @Args }

function rmv { coreutils.exe rm -vrI @Args }
function rmf { coreutils.exe rm -vrfI @Args }
function rmi { coreutils.exe rm -ri @Args }
