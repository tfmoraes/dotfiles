" No vi-compatible
set nocompatible

" It hides buffers instead of closing them. This means that you can have
" unwritten changes to a file and open a new file using :e, without being
" forced to write or undo your changes first.
set hidden
set backspace=indent,eol,start
set autoread
set title

" Don't beep
set visualbell
set noerrorbells

syntax on
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

"History
set history=1000
set undolevels=1000

" Indent
set autoindent
set smartindent

" Case insensitive apenas se a string de pesquisa não tiver caracteres
" maiusculos
set ignorecase
set smartcase

"Busca Incremental
set incsearch
set hlsearch

set wildmenu
set wildmode=longest,list
"Sempre mostra o menu, melhora o autocompletion
set completeopt=menuone,longest

set showmatch

set laststatus=2
"Mostra no rodape da tela a posição horizontal e vertical do cursor.
set ruler
"Envia mais caracteres ao terminal, melhorando o redraw de janelas.
set ttyfast
"Barra lateral onde aparece as guias para dobras
set fdc=2
set nofoldenable

"Set auto quando a arquivo é modificado por outro aplicativo
"Ativa quebra na palavra
set lbr
set scrolloff=3

set background=dark
set sessionoptions+=buffers

" Opções do ~/.vim/syntax/python.vim
let python_hightlight_all = 1
let python_slow_sync = 1


" Plugins
set runtimepath+=~/vim-plugins/vim-addon-manager
call scriptmanager#Activate(["snipmate"])
