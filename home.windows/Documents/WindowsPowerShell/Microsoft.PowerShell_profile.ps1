# function Prompt { "`n" + "> ${env:UserName} @ ${env:ComputerName} [$(Get-Date -UFormat '%Y-%m-%d %H:%M:%S %Z')] In [$(@(Get-History).Count + 1)] :`n" + "- $($ExecutionContext.SessionState.Path.CurrentLocation)`n" + $(if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { "# " } else { "$ " }) }
Invoke-Expression (&starship init powershell)

Set-PSReadLineKeyHandler -Key Tab -Function Complete


$env:EZA_MIN_LUMINANCE=65

function    e { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --grid @Args }
function   ee { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --oneline @Args }
function   el { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --time-style='+%Y-%m-%d %H %:::z' @Args }
function  ell { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --all --header --group --mounts --time-style='+%Y-%m-%d %H:%M:%S %:z' @Args }
function elll { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --all --header --group --mounts --inode --links --flags --context --extended --time-style='+%Y-%m-%d %H:%M:%S.%3f %::z' @Args }

function  et { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --tree --no-quotes @Args }
function etp { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --tree --no-quotes --long --group --no-filesize --no-time @Args }
function ets { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --tree --no-quotes --long --binary --no-permissions --no-user --no-time @Args }

function  etg { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --tree --no-quotes --long --no-permissions --no-filesize --no-user --no-time --git @Args }
function etgi { eza --color=auto --color-scale=all --color-scale-mode=gradient --icons=never --classify=auto --all --sort=name --group-directories-first --tree --no-quotes --long --no-permissions --no-filesize --no-user --no-time --git --git-ignore @Args }

function et1 { et -L 1 @Args }
function et2 { et -L 2 @Args }
function et3 { et -L 3 @Args }

function etp1 { etp -L 1 @Args }
function etp2 { etp -L 2 @Args }
function etp3 { etp -L 3 @Args }

function etg1 { etg -L 1 @Args }
function etg2 { etg -L 2 @Args }
function etg3 { etg -L 3 @Args }


function cat { bat -p @Args }
function catp { bat -pp @Args }
function catf { bat --style=header,grid,numbers --wrap=never @Args }


function cs { scrcpy --video-bit-rate=8M --audio-bit-rate=128K @Args }
function cso { cs --turn-screen-off @Args }
function csa { scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off @Args }


function mkv { coreutils.exe mkdir -vp @Args }

function cpv { coreutils.exe cp -vri @Args }
function mvv { coreutils.exe mv -vi @Args }

function rmv { coreutils.exe rm -vrI @Args }
function rmf { coreutils.exe rm -vrf @Args }
function rmi { coreutils.exe rm -ri @Args }


function    .. { Set-Location ../ }
function   ... { Set-Location ../../ }
function  .... { Set-Location ../../../ }
function ..... { Set-Location ../../../../ }
