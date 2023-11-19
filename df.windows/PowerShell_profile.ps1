# function Prompt { "`n" + "> ${env:UserName} @ ${env:ComputerName} [$(Get-Date -UFormat '%Y-%m-%d %H:%M:%S %Z')] In [$(@(Get-History).Count + 1)] :`n" + "- $($ExecutionContext.SessionState.Path.CurrentLocation)`n" + $(if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { "# " } else { "$ " }) }
Invoke-Expression (&starship init powershell)

Set-PSReadLineKeyHandler -Key Tab -Function Complete

function l { coreutils.exe ls -AF --color=always --group-directories-first -N @Args }
function ll { coreutils.exe ls -AF --color=always --group-directories-first -GhlN --time-style="+%Y-%m-%d %H %:::z" @Args }
function lll { coreutils.exe ls -AF --color=always --group-directories-first -ahil --time-style="+%Y-%m-%d %H:%M:%S %:z" @Args }

function e { eza --all --sort=name --group-directories-first --classify --color=automatic --color-scale=all --color-scale-mode=gradient --icons=never @Args }
function e1 { e --oneline --no-quotes @Args }
function el { e --long --no-quotes --binary --time-style='+%Y-%m-%d %H:%M %:::z' @Args }
function ell { el --all --header --group --links --mounts --time-style='+%Y-%m-%d %H:%M:%S %:z' @Args }
function elll { ell --inode --blocksize --extended --context --time-style='+%Y-%m-%d %H:%M:%S.%3f %::z' @Args }
function et { e --tree --no-quotes @Args }
function etl { et --long --binary --group --no-time @Args }
function et1 { et -L 1 @Args }
function et2 { et -L 2 @Args }
function et3 { et -L 3 @Args }
function etl1 { etl -L 1 @Args }
function etl2 { etl -L 2 @Args }
function etl3 { etl -L 3 @Args }

function cat { bat -p @Args }
function catp { bat -pp @Args }
function catf { bat --style=header,grid,numbers --wrap=never @Args }

function cdig { dig +all +nocookie @Args }
function cdigs { cdig +short @Args }

function cs { scrcpy --video-bit-rate=8M --audio-bit-rate=128K @Args }
function cso { cs --turn-screen-off @Args }
function csa { scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off @Args }

function mkv { coreutils.exe mkdir -vp @Args }

function cpv { coreutils.exe cp -vri @Args }
function mvv { coreutils.exe mv -vi @Args }

function rmv { coreutils.exe rm -vrI @Args }
function rmf { coreutils.exe rm -vrf @Args }
function rmi { coreutils.exe rm -ri @Args }
