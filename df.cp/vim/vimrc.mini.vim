" ##############################################################################
" #                            BASIC CONFIGURATION                             #
" ##############################################################################

" color
set t_Co=256
syntax enable

" encode
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,big5,euc-jp,euc-kr,latin1

" behaviour
function SetTextwidth()
    if &filetype == 'gitcommit'
        set textwidth=80
    endif
endfunction
autocmd BufEnter * call SetTextwidth()
set nowrap

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set autoindent
set formatoptions=croql

set whichwrap=<,>,[,]

set undodir=.
set undofile
set undolevels=1024

" appearance
set showmatch

set cursorline
"highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
set cursorcolumn
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

set colorcolumn=50,80,100
"highlight ColorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

set scrolloff=8
set sidescrolloff=24

set laststatus=2
set ruler

set number
highlight LineNr cterm=NONE ctermbg=202 ctermfg=235 guibg=NONE guifg=NONE

" set extra highlight
highlight WhitespaceEOL ctermbg=197 guibg=tomato
call matchadd('WhitespaceEOL', '\s\+$')
highlight TabAnywhere ctermbg=196 guibg=red
call matchadd('TabAnywhere', '\t\+')

autocmd ColorScheme * highlight WhitespaceEOL ctermbg=197 guibg=tomato
autocmd WinEnter * call matchadd('WhitespaceEOL', '\s\+$')
autocmd ColorScheme * highlight TabAnywhere ctermbg=196 guibg=red
autocmd WinEnter * call matchadd('TabAnywhere', '\t\+')


" ##############################################################################
" #                      KEYBOARD SHORTCUT CONFIGURATION                       #
" ##############################################################################

" general
set timeoutlen=500
let mapleader = ';'

" maneuver
nnoremap 'h :wincmd h<CR>
nnoremap 'j :wincmd j<CR>
nnoremap 'k :wincmd k<CR>
nnoremap 'l :wincmd l<CR>
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" function quick toggle
function SwitchFunction(function)
    if a:function == 'indent'
        if ((&autoindent != 1) || (&formatoptions != 'croql'))
            set autoindent
            set formatoptions=croql
            echo 'autoindent is on, formatoptions is croql'
        else
            set noautoindent
            set formatoptions=oql
            echo 'autoindent is off, formatoptions is oql'
        endif
    elseif a:function == 'hlsearch'
        set hlsearch!
        if &hlsearch == 1
            echo 'hlsearch is on'
        else
            echo 'hlsearch is off'
        endif
    elseif a:function == 'paste'
        set paste!
        if &paste == 1
            echo 'paste is on'
        else
            echo 'paste is off'
        endif
    elseif a:function == 'wrap'
        set wrap!
        if &wrap == 1
            echo 'wrap is on'
        else
            echo 'wrap is off'
        endif
    endif
endfunction

nnoremap <leader>ai :call SwitchFunction('indent')<CR>
nnoremap <leader>hl :call SwitchFunction('hlsearch')<CR>
nnoremap <leader>pa :call SwitchFunction('paste')<CR>
nnoremap <leader>wr :call SwitchFunction('wrap')<CR>

" insurance before quit
function CheckCloseBuffer(mode)
    let o = 0
    let s = 0
    for i in range(1, bufnr('$'))
        if buflisted(i) == 1
            let o += 1
        endif
    endfor
    for i in range(1, winnr('$'))
        if buflisted(winbufnr(i)) == 1
            let s += 1
        endif
    endfor
    if ((o > 1) && (s == 1))
        execute 'split'
        execute 'bnext'
        wincmd j
        if a:mode == 'bdelete'
            execute 'bdelete'
        elseif a:mode == 'close'
            execute 'close'
        endif
    elseif a:mode == 'bdelete'
        execute 'bdelete'
    else
        if winnr('$') == 1
            execute 'quit'
        else
            execute 'close'
        endif
    endif
    unlet o
    unlet s
endfunction

" conditionally toggle some shortcut
function MapWindowOperation()
    nnoremap <leader>n :bnext<CR>
    nnoremap <leader>p :bprevious<CR>
    vnoremap 'y "+y
    vnoremap 'p "+p
    vnoremap 'P "+P
    nnoremap 'p "+p
    nnoremap 'P "+P
    nnoremap <leader>s :write<CR>
    nnoremap <leader>q :call CheckCloseBuffer('bdelete')<CR>
    nnoremap <leader>c :call CheckCloseBuffer('close')<CR>
    nnoremap <leader>sq :write<CR>:call CheckCloseBuffer('bdelete')<CR>
    nnoremap <leader>sc :write<CR>:call CheckCloseBuffer('close')<CR>
endfunction

function UnmapWindowOperation()
    if getbufvar(winbufnr(winnr()), '&buftype') == 'help'
        unmap <leader>n
        unmap <leader>p
        unmap 'y
        unmap 'p
        unmap 'P
        unmap <leader>s
        unmap <leader>q
        unmap <leader>c
        unmap <leader>sq
        unmap <leader>sc
    endif
endfunction


" ##############################################################################
" #                                  AUTOCMD                                   #
" ##############################################################################

call MapWindowOperation()
autocmd WinEnter * call MapWindowOperation()
autocmd WinEnter * call UnmapWindowOperation()


" ##############################################################################
" #                       SOURCE VIM-PLUG CONFIGURATION                        #
" ##############################################################################

set termguicolors
colorscheme delek
