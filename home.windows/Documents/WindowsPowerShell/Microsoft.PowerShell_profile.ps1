Set-PSReadLineKeyHandler -Key Tab -Function Complete


$env:EZA_MIN_LUMINANCE=65

function    e { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-first --grid @args }
function   ee { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-first --oneline @args }
function   el { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --time-style='+%Y-%m-%d %H:%M:%S %:z' @args }
function  elt { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --sort=modified --time-style='+%Y-%m-%d %H:%M:%S %:z' @args }
function  ell { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --header --inode --octal-permissions --group --mounts --time-style='+%Y-%m-%d %H:%M:%S %:z' @args }
function elll { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-first --long --binary --no-quotes --header --inode --octal-permissions --group --mounts --links --flags --context --extended --time-style='+%Y-%m-%d %H:%M:%S.%3f %::z' @args }

function  et { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-last --tree --no-quotes @args }
function etl { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-last --tree --no-quotes --long --binary --no-user --time-style='+%Y-%m-%d %H:%M:%S %:z' @args }
function etp { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-last --tree --no-quotes --long --octal-permissions --group --no-filesize --no-time @args }
function ets { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-last --tree --no-quotes --long --binary --no-permissions --no-user --no-time @args }

function  etg { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-last --tree --no-quotes --long --no-permissions --no-filesize --no-user --no-time --git @args }
function etgi { eza --icons=never --color=auto --color-scale=all --color-scale-mode=gradient --classify=auto --all --sort=name --group-directories-last --tree --no-quotes --long --no-permissions --no-filesize --no-user --no-time --git --git-ignore @args }

function et1 { et -L 1 @args }
function et2 { et -L 2 @args }
function et3 { et -L 3 @args }

function etl1 { etl -L 1 @args }
function etl2 { etl -L 2 @args }
function etl3 { etl -L 3 @args }

function etp1 { etp -L 1 @args }
function etp2 { etp -L 2 @args }
function etp3 { etp -L 3 @args }

function etg1 { etg -L 1 @args }
function etg2 { etg -L 2 @args }
function etg3 { etg -L 3 @args }


function mkv { coreutils.exe mkdir -vp @args }

function cpv { coreutils.exe cp -vri --preserve=timestamps @args }
function mvv { coreutils.exe mv -vi @args }
function mvs { coreutils.exe mv -vi --exchange @args }

function rmv { coreutils.exe rm -vrI @args }
function rmf { coreutils.exe rm -vrf @args }
function rmi { coreutils.exe rm -ri @args }

function    .. { Set-Location ../ }
function   ... { Set-Location ../../ }
function  .... { Set-Location ../../../ }
function ..... { Set-Location ../../../../ }


function  cat { bat -pp @args }
function catp { bat -p @args }
function catf { bat --style=header,grid,numbers --wrap=never @args }


function cs { scrcpy --video-bit-rate=8M --audio-bit-rate=128K @args }
function cso { cs --turn-screen-off @args }
function csa { scrcpy --video-bit-rate=1M --audio-codec=opus --audio-bit-rate=256K --turn-screen-off @args }


function serve-rust-docs {
    Set-Location $(Split-Path -Path $(rustup +nightly doc --path) -Parent)
    if ($?) { python3 -m http.server 4725 }
}
