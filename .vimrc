set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PLUGINS .....................................................................
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'psf/black'

Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'python-mode/python-mode'

Plugin 'tabnine/YouCompleteMe'



" Plugin 'petobens/poet-v'

" THEME ........................................................................
" Some settings to enable the theme:

set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

" ...

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

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set tabstop=4
    \ set textwidth=79
    \ set expandtab
    \ set shiftround
    \ set autoindent
    \ set fileformat=unix

au BufNewFile, BufRead *.js,*.html,*.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set backspace=indent,eol,start
set encoding=utf-8

" PYMODE SETTINGS .................................................................

let g:pymode = 1

let g:pymode_warnings = 1
let g:pymode_options = 1

let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 79

let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

" PYMODE PYTHON SETTINGS ...........................................................

let g:pymode_python = 'python3'
let g:syntastic_python_python_exec='python3'
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_indent_hanging_width = &shiftwidth
let g:pymode_indent_hanging_width = 4

" PYMODE VIRTUALENV and LINTING .....................................................

let g:pymode_virtualenv = 0
let g:pymode_virtualenv_path = $VIRTUAL_ENV

let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_ignore = ["E203", "E501", "W"]
let g:pymode_lint_options_mccabe = { 'complexity': 12 }

" PYMODE PYDOC ......................................................................
" Show pydoc documentation  -- :PymodeDoc <args>

let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

" PYMODE SYNTAX .....................................................................
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1


" PYTHON BLACK

autocmd BufWritePre *.py execute ':Black'
