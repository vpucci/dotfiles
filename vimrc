"""""""""""""""""""""""""""
" Vim Plugins with Vundle "
"""""""""""""""""""""""""""
" Please note Vundle requires Python2.6+ "
let validpython=$PYTHON_OK

function! UseVundle()
    " Required options for Vundle
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim

    call vundle#begin()
    " Plugins
    " To install all plugins:
    " " From Vim, run :PluginInstall
    " " From command line, run vim +PluginInstall +qall
    Plugin 'gmarik/Vundle.vim'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'lokaltog/powerline'
    Plugin 'tell-k/vim-autopep8'

    call vundle#end()

    " Powerline for Vim
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    set encoding=utf-8
    set laststatus=2
    set ambiwidth=single
endfunction

if validpython == '1'
    call UseVundle()
endif

""""""""""""""""""
" GLOBAL OPTIONS "
""""""""""""""""""

" Auto-reload vimrc "
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

:set background=dark
:syntax enable
:set backspace=2

" limit the number of characters of commit msg to 76
au FileType gitcommit set tw=76
