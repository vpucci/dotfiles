"========================
" Vim Plugins with Vundle
"========================
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

    " Let's Vundle manage Vundle
    Plugin 'gmarik/Vundle.vim'

    " My Vundles
    Plugin 'christoomey/vim-tmux-navigator'
    Bundle 'lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plugin 'tell-k/vim-autopep8'
    Plugin 'ervandew/supertab'

    call vundle#end()

    " Powerline for Vim
    let g:Powerline_symbols='fancy'
    set encoding=utf-8
    set term=xterm-256color
    set t_Co=256
    set termencoding=utf-8
    set laststatus=2
    set ambiwidth=single
    set fillchars+=stl:\ ,stlnc:\
endfunction

if validpython == '1'
    call UseVundle()
endif

"===============
" GLOBAL OPTIONS
"===============

" Auto-reload vimrc "
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

:set background=dark
:syntax enable
:set backspace=2
" let vim gets control of the mouse
:set mouse=a

" limit the number of characters of commit msg to 76
au FileType gitcommit set tw=76
