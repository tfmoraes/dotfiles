"Não compatível com o VI
set nocompatible
set autoindent
set smartindent
set backspace=indent,eol,start
set autoread

set title

set hidden
set history=1000

syntax on
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

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
"Inclui o < e > no matching
set matchpairs+=<:>

set laststatus=2
"Mostra no rodape da tela a posição horizontal e vertical do cursor.
set ruler
"Envia mais caracteres ao terminal, melhorando o redraw de janelas.
set ttyfast
"Barra lateral onde aparece as guias para dobras
set fdc=2
set nofoldenable

set scrolloff=3
"Set auto quando a arquivo é modificado por outro aplicativo
"Ativa quebra na palavra
set lbr
set background=dark

set sessionoptions+=buffers

" Opções do ~/.vim/syntax/python.vim
let python_hightlight_all = 1
let python_slow_sync = 1

function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif 
endfunction 
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
\ | wincmd p | diffthis
endif

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"if has("autocmd")
"    autocmd FileType python set complete+=k/home/thiago/pydiction-0.5/pydiction iskeyword+=.,(
"endif " has("autocmd")

map <C-o> <ESC>:tabnew<CR>
map <C-q> <ESC>:tabclose<CR>
"map  <ESC>:tabnext<cr>
"map 	 <ESC>:tabnext<CR>
"map    <ESC>:tabpresvious<CR>
"Desativa o highlight do hlsearch
map <F9> :noh<CR>
"Ativa/Desativa a numeração de linhas
set number
map <F12> :set number!<CR>

"Fechamento automático de parênteses, chaves e colchetes
"imap { {}<left>
"imap ( ()<left>
"imap [ []<left>

cab W w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q q
cab q1 q!

let mapleader=","

"Testando 
"substituindo a palavra sob o cursor
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

"set runtimepath+=/usr/share/vim-scripts

" PLUGINS

" Tag List
let Tlist_Auto_Open=0
let Tlist_Inc_Winwidth=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Fold_Column=0
let Tlist_File_Fold_Auto_Close=1
let tlist_php_settings='php;c:class;d:constant;f:function'
nnoremap <silent> <F8> :TlistToggle<CR>

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" movement work more logically with wrapped lines
noremap j gj
noremap k gk

" buftabs
" let g:buftabs_only_basename=1 
" let g:buftabs_in_statusline=0 
" let g:buftabs_active_highlight_group="Visual" 

noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
noremap <leader>bd :bdelete<CR>

map <Leader>tl :TaskList<CR>
" FuzzyFinder
" map <leader>f :FufFile <CR>
" noremap <leader>t :FufFile**/<CR>
" map <leader>b :FufBuffer<CR>

"NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" opções para mostrar espaços e tabulações
map <leader>l :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" ipython & vim
map <leader>rl :python run_current_line()<cr>
map <leader>rs :python run_selection()<cr>
map <leader>rb :python run_buffer()<cr>

"SnipMate
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/snipmate/'))

" neocomplcache
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/neocomplcache'))
so ~/.vim/bundles/neocomplcache/.vimrc

" Enhanced Commentify
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/enhanced_commentify'))
let g:EnhCommentifyRespectIndent = 'Yes' " To respect the indentation
let g:EnhCommentifyPretty = 'Yes' " Adds a whitespace

" vim-latex
" call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/vim_latex'))

" set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files
" defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being
" loaded.
" " The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'


" Supertab
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/supertab/'))
let g:SuperTabDefaultCompletionType = 'context'

" Syntatic
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/syntastic/'))
let g:syntastic_enable_signs=1

" Omnicpp
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/omnicppcomplete/'))
augroup cpp
au BufRead,BufNewFile *.cpp set tags+=~/.cpp_tags
au BufRead,BufNewFile *.cpp let OmniCpp_MayCompleteDot = 0
au BufRead,BufNewFile *.cpp let OmniCpp_MayCompleteArrow = 0
augroup end

" font-zoom
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/fontzoom/'))

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
" miniBufExplorer
" --------------------
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1 

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

" align
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/align/'))

" Bufexplorer
" call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/bufexplorer/'))

" delimitmate
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/delimitmate/'))

" RagTag
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/ragtag/'))

" Sparkup
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/sparkup/'))

" Speed dating
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/speeddating/'))

call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/conque_shell'))

" Command t
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles/command_t'))
noremap <leader>t :CommandT<CR>
let g:CommandTMatchWindowAtTop = 1


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
