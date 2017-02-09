set nocompatible
filetype off
syntax on

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-grepper'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'Ternjs/tern_for_vim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'Shougo/neosnippet-snippets'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'othree/csscomplete.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-visual-star-search'
Plug 'jelera/vim-javascript-syntax'
Plug 'haya14busa/incsearch.vim'
Plug 'othree/jspc.vim'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'
Plug 'szw/vim-maximizer'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'racer-rust/vim-racer'
call plug#end()
filetype plugin on

set nomodeline
set t_ut=
runtime macros/matchit.vim

set encoding=utf-8
set fileencoding=utf-8
set nowrap
set sidescroll=1

let g:maximizer_default_mapping_key = '<C-F>'
let g:polyglot_disabled = ['css', 'scss', 'javascript']
let g:tern_show_argument_hints='on_hold'

au BufNewFile,BufRead *.handlebars set filetype=mustache
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir
au BufRead,BufNewFile *.rs set filetype=rust
autocmd BufEnter * :syntax sync fromstart
let g:racer_cmd = "/Users/mat/.cargo/bin/racer"
set background=dark
colorscheme solarized

" Tabs as 4 spaces
set tabstop=4
set shiftwidth:4
set expandtab
set smarttab

" Show different commad options
set wildmenu
" Show commands as you're typing 'em
set showcmd
let g:tagbar_left = 1

" Make thing fast!
set ttyfast
set lazyredraw

" Space as mapleader
let mapleader = " "

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[6 q"
    let &t_EI = "\<Esc>[2 q"
endif

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
endif

" Always neomake
autocmd! BufWritePost * Neomake

nnoremap K {
nnoremap J }

vnoremap K {
vnoremap J }

" Mousemode on!
set mouse=a

" Show linenumbers by default
set number

" Make backspace delete empty
set backspace=indent,eol,start

" Set default shell as regular ol bash
set shell=/bin/bash

" No weird ex mode, please!
nnoremap Q <nop>

" Map moving to command mode as jk, since reaching for ESC is for suckers!
imap jk <Esc>
imap JK <Esc>

set hlsearch
set incsearch

nnoremap <leader>/ :Grepper -tool ag<cr>

" incsearch plugin mappings, enable highlighting etc
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

autocmd InsertEnter * :set nohlsearch

nnoremap <leader>t :TagbarToggle<CR>
" Reselect visual mode selection after shift
vnoremap > >gv
vnoremap < <gv

" Airline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

" Weird hack to enable alt keys in konsole
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeoutlen=1000
set ttimeoutlen=0

" Set up CtrlP related stuff, ignore git folders and nodejs node_modules in
" results
let g:ctrlp_show_hidden = 0
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|git\|www\|platforms\|plugins\|venv\|__pycache__\'

" Use silver searcher if available
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    let g:ackprg = 'ag --vimgrep'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Enable emmet with leader key
let g:user_emmet_install_global = 0
autocmd FileType html,css,mustache,javascript,htmldjango,vue EmmetInstall
let g:user_emmet_leader_key=','

let g:acp_enableAtStartup = 0
set laststatus=2

" Always enable neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

 " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }


if !exists('g:neocomplete#keyword_patterns')
     let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <expr> <TAB> pumvisible() ? "\<C-Y>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
   " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" "<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#ComackpleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions

let g:go_fmt_command = "goimports"

if !exists('g:neocomplete#sources#omni#input_patterns')
   let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif


let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:jedi#documentation_command = ''
let g:jedi#show_call_signatures = 2


" Hack for Alt + arrow keys to work in tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Sync unnamed clipboard to system clipboard
set clipboard=unnamed

" Autoreload vim on changes to .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Don't clutter current directory with Vim tmp-files
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

" Enable persistent undo
set undofile
set undodir=~/vimundo
set undolevels=1000
set undoreload=10000

