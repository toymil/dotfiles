set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'mbbill/fencview'

Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ##############################################################################
" #                            PLUGIN CONFIGURATION                            #
" ##############################################################################

" fencview
let $FENCVIEW_TELLENC = 'fencview'
let g:fencview_checklines = 0

" gruvbox
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" airline
let g:airline#extensions#tabline#enabled = 1

" indentLine
autocmd BufEnter * IndentLinesReset
let g:indentLine_char = '¦'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_indentLevel = 32
let g:indentLine_faster = 1


" ##############################################################################
" #                         PLUGIN EXTRA CONFIGURATION                         #
" ##############################################################################

function MapPluginWindowOperation()
  nnoremap <leader>en :FencAutoDetect<CR>
endfunction

function UnmapPluginWindowOperation()
    if getbufvar(winbufnr(winnr()), '&buftype') == 'help'
        unmap <leader>en
    endif
endfunction


" ##############################################################################
" #                                  AUTOCMD                                   #
" ##############################################################################

autocmd VimEnter * call MapPluginWindowOperation()
autocmd WinEnter * call MapPluginWindowOperation()
autocmd Winenter * call UnmapPluginWindowOperation()
