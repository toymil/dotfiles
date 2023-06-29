call plug#begin('~/.vim/plugged')

Plug 'mbbill/fencview'

Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

call plug#end()


" ##############################################################################
" #                            PLUGIN CONFIGURATION                            #
" ##############################################################################

" fencview
let $FENCVIEW_TELLENC = 'fencview'
let g:fencview_checklines = 0

set termguicolors
" gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
colorscheme gruvbox

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '  '

" indentLine
autocmd BufEnter * IndentLinesReset
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0
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
