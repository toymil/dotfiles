let path_vim_plug = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vim-plug.vim'
if filereadable(path_vim_plug)
    execute 'source ' . path_vim_plug
endif
