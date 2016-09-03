set nocompatible
filetype off
syntax on
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Ternjs/tern_for_vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'melonmanchan/vim-tmux-resizer'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'dkprice/vim-easygrep'
Plugin 'ap/vim-css-color'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'elixir-lang/vim-elixir'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/csscomplete.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'haya14busa/incsearch.vim'
Plugin 'othree/jspc.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'szw/vim-maximizer'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
call vundle#end()
filetype plugin indent on
filetype plugin on

runtime macros/matchit.vim

set encoding=utf-8
set fileencoding=utf-8
set nowrap
set sidescroll=1
" set termguicolors

if has('gui_running')
  set guifont=Hack\ 12
endif


let g:maximizer_default_mapping_key = '<C-F>'

let g:polyglot_disabled = ['css', 'scss']
let g:tern_show_argument_hints='on_hold'
au BufNewFile,BufRead *.handlebars set filetype=mustache

au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir

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

autocmd FileType nerdtree setlocal nolist
let NERDTreeShowHidden=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

map <leader>. :NERDTreeToggle<CR>

nnoremap K {
nnoremap J }

vnoremap K {
vnoremap J }

" Show tabs as a character
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

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

" Don't open vim.ack first result in window
cnoreabbrev Ack Ack!
nnoremap <leader>/ :Ack!<Space>

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

" Reselect visual mode selection after shift
vnoremap > >gv
vnoremap < <gv

" Ctrl-S as save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" And Ctrl-Q as quit
noremap <C-Q> <C-O>:q!<CR>
inoremap <C-Q> <C-O>:q!<CR>
:nmap <C-Q> :q!<CR>

noremap <silent> <C-z>          :u<CR>
vnoremap <silent> <C-z>         :u<CR>
inoremap <silent> <C-z>         <C-O>u

" Syntastic statusline stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_css_checkers = ['csslint']
let g:syntastic_scss_checkers = ['sass']
let g:syntastic_go_checkers = ['golint', 'go', 'govet', 'errcheck']

" Golang syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 0
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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

" Default to private GitHub gists
let g:gist_post_private = 1

" Set up CtrlP related stuff, ignore git folders and nodejs node_modules in
" results
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|git\|www\|platforms\|plugins'

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
autocmd FileType html,css,mustache,javascript EmmetInstall
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
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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

" Git fugitive plugin mappings
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gl :Gpull<CR>

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#ComackpleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete

let g:neocomplete#sources#omni#functions = {'go': 'go#complete#Complete'}

if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
endif

" Hack for Alt + arrow keys to work in tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

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

" Make editorconfig play nice with git-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

au BufRead,BufNewFile *.rs set filetype=rust

