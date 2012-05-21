"--------------------------------------------------------
"
" Dependencies
"-------------------------------------------------------
" Ack
" pyflakes

"-----------------------------------------------------
" Shortcuts
" ----------------------------------------------------
"  ,b - lusty-juggler (bufferlist)
"  ,bd - Close a buffer
"  ,d - nerdtree
"  ,l - Shows the no-printable chars, like tabs and EOL
"  ,nh - no highlight
"  ,nn - toggle number
"  ,t - command-t
"  ,k - tagbar
"  <S-Right> - next buffer
"  <S-Left> - previous buffer
"  j - gj
"  k - gk
"  ,u - gundotoggle
"  <S-Up> - Bubble single/selected line(s) up
"  <S-Down> - Bubble single/selected line(s) down


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

set listchars=tab:▸\ ,eol:¬

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
set number
set sessionoptions+=buffers


" Opções do ~/.vim/syntax/python.vim
let python_hightlight_all = 1
let python_slow_sync = 1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
\ | wincmd p | diffthis
endif

"--------------------------------------------------------
" Abreviations
" -------------------------------------------------------
cab W w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q q
cab q1 q!

" ------------------------------------------------------
" Mappings
" -----------------------------------------------------

" movement work more logically with wrapped lines
let mapleader=","

noremap j gj
noremap k gk

map <leader>l :set list!<cr>

noremap <S-right> :bprev<CR>
noremap <S-left> :bnext<CR>
noremap <leader>bd :bdelete<CR>

nmap <leader>nh :noh<CR>
nmap <leader>nn :set number!<CR>

vnoremap < <gv
vnoremap > >gv

" Bubble single lines
nmap <S-Up> [e
nmap <S-Down> ]e

" Visually select the text that was last edited/pasted
nmap gV `[v`]
"---------------------------------------------------------
"Plugins
"---------------------------------------------------------
set runtimepath+=~/.vim-addons/vim-addon-manager
call vam#ActivateAddons(["snipmate", "nerdtree", "tagbar", "yankring", "ack", "surround", "syntastic", "showmarks", "nerdcommenter", "supertab", "repeat", "vim-indent-object", "sparkup", "speeddating", "ctrp", "py2stdlib", "fugitive", "indent-guides", "gundo", "solarized", "golang", "smartinput", "powerline", "itchy", "buffet", "unimpaired"])

"-------------------
" Tag List
" ------------------
"let Tlist_Auto_Open=0
"let Tlist_Inc_Winwidth=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Enable_Fold_Column=0
"let Tlist_File_Fold_Auto_Close=1

"" Mac have bsd ctags, here we use the exuberant ctags
"if has("mac")
	"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"endif

"nnoremap <silent><leader>k :TlistToggle<CR>

" -----------------------
"  Tagbar
"  ----------------------
" Mac have bsd ctags, here we use the exuberant ctags
if has("mac")
	let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

" Tagbar will be opened at left.
let g:tagbar_left = 1


nnoremap <silent><leader>k :TagbarToggle<CR>

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

"--------------------
" Supertabs
" -------------------
let g:SuperTabDefaultCompletionType = 'context'

"-----------------
" minibufexplpp
" ---------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"----------------
" Command-t
" --------------
"map <leader>t :CommandT <CR>
"

"----------------
" Ctrl-P
" ---------------
let g:ctrlp_map = '<leader>t'
nnoremap <leader>b :CtrlPBuffer <CR>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore='.pyc$'
let g:ctrlp_match_window_bottom = 0

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.swp$',
  \ }

"----------------
" Gundo
" --------------
map <leader>u :GundoToggle <CR>

" --------------------
"statusline setup
" --------------------
"set statusline=%f "tail of the filename
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
set statusline=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag
" set statusline+=0x%-8B " character value
 " 
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" display a warning if &paste is set
" set statusline+=%#error#
" set statusline+=%{&paste?'[paste]':''}
" set statusline+=%*

set statusline+=%{fugitive#statusline()}

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

"let g:buftabs_in_statusline=1
"let g:buftabs_only_basename=1
""let g:buftabs_active_highlight_group="Visual"
"set statusline+=%{buftabs#statusline()}

"====================================

"Golang
set rtp+=$GOROOT/misc/vim

" Itchy
map <leader><tab> :Scratch <CR>

" Buffergator
"let g:buffergator_suppress_keymaps = 1
"map <leader>bt :BuffergatorToggle <CR>
"
"Buffet
map <leader>bl :Bufferlist <CR>

" Unimpaired
" Bubble multiple lines
vmap <S-Up> [egv
vmap <S-Down> ]egv
