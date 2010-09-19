"--------------------------------------------------------
" Dependencies
"-------------------------------------------------------
" Ack
" pylint

"-----------------------------------------------------
" Shortcuts
" ----------------------------------------------------
"  ,l - taglist
"  ,d - nerdtree


" ----------------------------------------------------
" Now the configuration
" ----------------------------------------------------

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

" Mappings
" movement work more logically with wrapped lines
let mapleader=","
noremap j gj
noremap k gk


" Plugins
set runtimepath+=~/.vim-addons/vim-addon-manager
call scriptmanager#Activate(["snipmate", "nerdtree", "taglist", "yankring", "ack", "surround", "syntastic", "showmarks"])

"-------------------
" Tag List
" ------------------
let Tlist_Auto_Open=0
let Tlist_Inc_Winwidth=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Fold_Column=0
let Tlist_File_Fold_Auto_Close=1
nnoremap <silent><leader>l :TlistToggle<CR>

"--------------------
" NERDTree
" ------------------
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen


" --------------------
"statusline setup
" --------------------
set statusline=%f "tail of the filename
 " 
" display a warning if fileformat isnt unix
" set statusline+=%#warningmsg#
" set statusline+=%{&ff!='unix'?'['.&ff.']':''}
" set statusline+=%*
 " 
" display a warning if file encoding isnt utf-8
" set statusline+=%#warningmsg#
" set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
" set statusline+=%*
 " 
set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag
" set statusline+=0x%-8B " character value
 " 
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{Tlist_Get_Tagname_By_Line()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" display a warning if &paste is set
" set statusline+=%#error#
" set statusline+=%{&paste?'[paste]':''}
" set statusline+=%*
 " 
set statusline+=%= "left/right separator
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file

"set statusline=
"set statusline+=%=
"set statusline+=%h%m%r%w " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
"set statusline+=0x%-8B " character value
"set statusline+=%l,%c%V " line, character
"set statusline+=%P " file position

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction
