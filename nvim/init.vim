" List of buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction


call plug#begin('~/.config/nvim/plugged/')

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'trusktr/seti.vim'
Plug 'morhetz/gruvbox'
Plug '29decibel/codeschool-vim-theme'
Plug 'ajmwagar/vim-deus'

Plug 'ryanoasis/vim-devicons'

" neovim-qt
Plug 'equalsraf/neovim-gui-shim'

" Better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'

" Better vim startup screen
"Plug 'mhinz/vim-startify'

" Distraction free
Plug 'junegunn/goyo.vim'

"Org-mode
Plug 'jceb/vim-orgmode'


" Align line based on some characters
Plug 'junegunn/vim-easy-align'

" File tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Easy to comment codes
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" To open file and buffer faster
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-tag'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" Fuzzy file, buffer, mru, tag, etc finder.
" Plug 'kien/ctrlp.vim'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = {
  " \ 'dir': '\.git$\|\.sass-cache$|\.hg$\|\.svn$\|\.yardoc\|public$|log\|tmp$|vendor$|coverage$',
  " \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.pyc$|\.pyo$'
  " \ }
" let g:ctrlp_extensions = ['dir', 'mixed', 'tag', 'buffertag']
" let g:ctrlp_max_files = 2000
" let g:ctrlp_max_depth = 10
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      " \ --ignore .git
      " \ --ignore .svn
      " \ --ignore .hg
      " \ --ignore .DS_Store
      " \ --ignore "**/*.pyc"
      " \ -g ""'

" " PyMatcher for CtrlP
" Plug 'FelikZ/ctrlp-py-matcher'
" if !has('python')
  " echo 'In order to use pymatcher plugin, you need +python compiled vim'
" else
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" endif

" Git tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" To delete surrounding chars easily
Plug 'tpope/vim-surround'

" Repeate some ops
Plug 'tpope/vim-repeat'

" Open the file on the last position before closed
Plug 'dietsche/vim-lastplace'

" Speed dating
Plug 'tpope/vim-speeddating'

" Show indent guides
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'Yggdroot/indentLine'
"let g:indentLine_faster=1

" Show trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" A class viewer
Plug 'majutsushi/tagbar'

" Show the register stuff
Plug 'junegunn/vim-peekaboo'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Better autocomplete
" function! DoRemote(arg)
  " UpdateRemotePlugins
" endfunction
" Plug 'autozimu/LanguageClient-neovim', {
            " \ 'branch': 'next',
            " \ 'do': 'bash install.sh',
" \ }
" Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}
" Plug 'Shougo/neco-syntax'
" Plug 'Shougo/neco-vim'
" Plug 'zchee/deoplete-jedi'
" if executable('clang')
    " Plug 'zchee/deoplete-clang',  {'for': ['cpp', 'c']}
" endif

" if executable('racer')
    " Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
" endif
" Deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1

" inoremap <silent><expr> <Tab>
" \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

" let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-3.8/lib/libclang.so.1"
" let g:deoplete#sources#clang#clang_header = "/usr/include/clang/"
" let g:deoplete#sources#rust#racer_binary='/Users/thiago/.cargo/bin/racer'
" inoremap <silent><expr> <TAB>
            " \ pumvisible() ? "\<C-n>" :
            " \ <SID>check_back_space() ? "\<TAB>" :
            " \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" let g:LanguageClient_serverCommands = {
            " \ 'python': ['pyls'],
            " \ 'cpp': ['clangd'],
            " \ 'go': ['go-langserver'],
            " \ }
" nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>


" YCM
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

set updatetime=300

"Plug 'davidhalter/jedi-vim'

" Shows the vim undo tree
Plug 'mbbill/undotree'

" Better diff
Plug 'chrisbra/vim-diff-enhanced'

Plug 'will133/vim-dirdiff'

" jump to a char based on 2 chars
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

" Jump between .h and .c or .cpp file
Plug 'vim-scripts/a.vim'

" Grep files inside current folder
Plug 'mileszs/ack.vim'

" Better cut (copy) paste
" Plug 'vim-scripts/YankRing.vim'
Plug 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <c-p> <Plug>(miniyank-cycle)
map <c-n> <Plug>(miniyank-cyclebak)

Plug 'tpope/vim-unimpaired'

" Auto close parentheses
" Plug 'cohama/lexima.vim'

" Snipts
let g:UltiSnipsEditSplit = 'normal'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-tab>"
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Nvim with ipython
" Plug 'bfredl/nvim-ipy'

" Better python-indent
Plug 'hynek/vim-python-pep8-indent'
Plug 'ambv/black'

" Isort
Plug 'fisadev/vim-isort'

" Python folding
" Plug 'tmhedberg/SimpylFold'

" Latex support
" Plug 'lervag/vimtex'
" let g:vimtex_fold_enabled=0
" let g:vimtex_quickfix_latexlog = {'general' : 0}
nnoremap <silent> <space>b :exe 'CocCommand latex.Build'<CR>

" Markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

" Javascript
Plug 'pangloss/vim-javascript'

" GLSL
Plug 'tikhomirov/vim-glsl'

" HTML
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'xml', 'ftl']}

" Plug 'edsono/vim-matchit'

Plug 'vim-scripts/python_match.vim'
Plug 'benjifisher/matchit.zip'

Plug 'troydm/zoomwintab.vim'

Plug 'kshenoy/vim-signature'

" Nim
Plug 'https://github.com/zah/nim.vim.git'

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Typescript
Plug 'leafgarland/typescript-vim'


" Hacker news!
Plug 'dansomething/vim-hackernews', {'on':  'HackerNews'}

" Repl
Plug 'kassio/neoterm'
"{{
let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_automap_keys = ',tt'
let g:neoterm_keep_term_open = 1

nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>
map <silent> <f10> :Ttoggle<cr>
tmap <silent> <f10> <c-\><c-n>:Ttoggle<cr>

" Useful maps
" closes the all terminal buffers
nnoremap <silent> ,tc :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
"}}

" Make
" Plug 'benekastah/neomake'
" let g:neomake_verbose = 0
" augroup Neomake
    " au!
    " au! BufWritePost * Neomake
" augroup END

"Improved /-search for Vim.
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'

Plug 'ludovicchabant/vim-gutentags'
" {{{

  let g:gutentags_ctags_exclude= [
      \ '*.min.js',
      \ '*html*',
      \ 'jquery*.js',
      \ '*/vendor/*',
      \ '*/node_modules/*',
      \ '*/migrate/*.rb'
      \ ]
  " let g:gutentags_generate_on_missing = 0
  " let g:gutentags_generate_on_write = 0
  " let g:gutentags_generate_on_new = 0
  " nnoremap <leader>gt :GutentagsUpdate!<CR>
" }}}
"
"
Plug 'hrj/vim-DrawIt'

Plug 'Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/Nextcloud/Notes/']

call plug#end()

set laststatus=2

set backspace=indent,eol,start
set autoread
set title

" Don't beep
set visualbell
set noerrorbells

" Para usar o mouse
set mouse=a

syntax on
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

"History
set history=1000
set undolevels=1000

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" Indentation
set autoindent
set breakindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Appearance
set display+=lastline
set ruler
set showcmd
set wildmenu

" Using Solarized
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
"autocmd VimEnter * colorscheme base16-solarized
colorscheme gruvbox

set number
set hidden
set scrolloff=2

set listchars=tab:▸\ ,eol:¬
"set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+


set wildmenu
set wildmode=longest,list
"Sempre mostra o menu, melhora o autocompletion
set completeopt=menuone,longest

" show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Backup
set backup
set backupdir=~/.nvim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.nvim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

function! s:GetVisual()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - 2]
  let lines[0] = lines[0][col1 - 1:]
  return lines
endfunction


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

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

noremap <Space><Right> :bnext<CR>
noremap <Space><Left> :bprev<CR>
noremap <leader>db :bdelete<CR>

nmap <leader>nh :noh<CR>
nmap <leader>nn :set number!<CR>

vnoremap < <gv
vnoremap > >gv

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" jk is escape
inoremap jk <esc>

" Window manipulation
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-l> <c-\><c-n><c-w>l
" zoom with <c-w>z in any mode
nnoremap <silent> <c-w>z :ZoomWinTabToggle<cr>
inoremap <silent> <c-w>z <c-\><c-n>:ZoomWinTabToggle<cr>a
vnoremap <silent> <c-w>z <c-\><c-n>:ZoomWinTabToggle<cr>gv
if has('nvim')
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-l> <c-\><c-n><c-w>l
  tnoremap <silent> <c-w>z <c-\><c-n>:ZoomWinTabToggle<cr>
  tnoremap <Esc><Esc> <c-\><c-n>
  au WinEnter term://* call feedkeys('i')
endif

augroup Terminal
  au!
  au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
  au WinEnter term://* startinsert
augroup END

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tagbar#flags = 'f'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" " YCM 
" " let g:airline#extensions#ycm#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" let g:lightline = {
      " \ 'colorscheme': g:colors_name,
      " \ 'active': {
      " \   'left': [ [ 'mode', 'paste' ],
      " \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      " \ },
      " \ 'component_function': {
      " \   'gitbranch': 'fugitive#head',
      " \   'filetype': 'MyFiletype',
      " \   'fileformat': 'MyFileformat',
      " \ },
      " \ }
" set showtabline=2
" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}
" let g:lightline#bufferline#show_number = 2
" let g:lightline#bufferline#number_map = {
" \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
" \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

" nmap <Leader>1 <Plug>lightline#bufferline#go(1)
" nmap <Leader>2 <Plug>lightline#bufferline#go(2)
" nmap <Leader>3 <Plug>lightline#bufferline#go(3)
" nmap <Leader>4 <Plug>lightline#bufferline#go(4)
" nmap <Leader>5 <Plug>lightline#bufferline#go(5)
" nmap <Leader>6 <Plug>lightline#bufferline#go(6)
" nmap <Leader>7 <Plug>lightline#bufferline#go(7)
" nmap <Leader>8 <Plug>lightline#bufferline#go(8)
" nmap <Leader>9 <Plug>lightline#bufferline#go(9)
" nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" function! MyFiletype()
  " return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction

" function! MyFileformat()
  " return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction

" Unite
" " Use ag for search
let g:unite_source_history_yank_enable = 1
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

map <F2> :NERDTreeToggle<CR>

" YCM
" autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
" autocmd FileType cpp nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_collect_identifiers_from_tags_files = 1



autocmd FileType python setlocal completeopt-=preview

autocmd FileType tex let g:airline#extensions#tagbar#flags = ''

"nnoremap <silent> <Leader>b :call fzf#run({
"\   'source':  reverse(<sid>buflist()),
"\   'sink':    function('<sid>bufopen'),
"\   'options': '+m',
"\   'down':    len(<sid>buflist()) + 2
"\ })<CR>

" FZF {{{
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>t :Tags<cr>

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
"}}}

"show CtrlP menu
"noremap <leader>f :CtrlP<CR>
""show CtrlP menu for buffer
"noremap <leader>b :CtrlPBuffer<CR>
"nnoremap <silent> <leader>t :CtrlPTag<CR>

" Unite
let g:unite_source_grep_command = 'ag'
let g:unite_prompt='» '
let g:unite_source_tag_max_fname_length = 50

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" nnoremap <leader>f :<C-U>Unite -start-insert  file_rec/async<cr>
" nnoremap <Leader>t :<C-U>Unite -start-insert -auto-preview tag<CR>
" nnoremap <leader>b :<C-U>Unite -start-insert  buffer<cr>

function! s:UniteSettings()
  let b:actually_quit = 0
  setlocal updatetime=3
  au! InsertEnter <buffer> let b:actually_quit = 0
  au! InsertLeave <buffer> let b:actually_quit = 1
  au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif
endfunction

autocmd FileType unite call s:UniteSettings()

command! -bar FZFTags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

runtime colors.vim


" unmap ê
" tunmap ê
" cunmap ê
" iunmap ê
