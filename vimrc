set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'mxw/vim-jsx'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

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

" Default file encoding
set encoding=utf8
set fileencoding=utf8

" Default whitespace managing
set ts=4 sts=4 sw=4 expandtab

" Use mouse
set mouse=a

" Set to 256 colors
set t_Co=256

" Syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch    " Highlight search
    set incsearch   " Search as you type
endif

" Turn on filetype detection
filetype on

" Filetype indentation
filetype plugin indent on

autocmd BufNewFile,BufRead *.zcml set ft=xml
autocmd BufNewFile,BufRead *.load set ft=htmldjango

" Set whitespace managing for every filetype, overriding standard
" Configure vim to be PEP8 compliant when editing Python code
autocmd FileType python,python.django setlocal ts=4 sts=4 sw=4 expandtab cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType html,xml,htmldjango,javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType makefile setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType tex setlocal wm=3          " Automatically wrap at 3 columns from the window border

" Automatically remove trailing whitespace before saving
" http://stackoverflow.com/a/1618401/1651545
"fun! <SID>StripTrailingWhitespaces()
    "let l = line(".")
    "let c = col(".")
    "%s/\s\+$//e
    "call cursor(l, c)
"endfun
"autocmd FileType c,cpp,java,php,ruby,python,html,htmldjango,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set number                          " Use line numbers
set numberwidth=4                   " Minimum field width for line numbers

" airline things
set laststatus=2                    " Use 2 lines for the statusbar
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline_exclude_filenames=[]
let g:airline_exclude_filetypes=[]
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Colorscheme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Autoreload ~/.vimrc after saving it
" seen here: http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Let backspace be more friendly
set backspace=indent,eol,start

" Enable folding
autocmd FileType python,xml,html,htmldjango,python.django,javascript,css set foldmethod=indent
autocmd FileType python,xml,html,htmldjango,python.django,css set foldnestmax=2
autocmd FileType javascript set foldnestmax=3

" Configure vim-flake8
let g:flake8_cmd="/Users/pieronicolli/Lab/utils/bin/flake8" " set custom flake8 binary
let g:flake8_show_in_gutter=1 " show errors in gutter
autocmd BufWritePost *.py call Flake8() " automatically run flake8 when saving

" Let vim-jsx also parse js files
" let g:jsx_ext_required = 0
