set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'yangmillstheory/vim-snipe'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript',  {'do': './install.sh'}
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'Shougo/neosnippet-snippets'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'ewilazarus/preto'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'
Plug 'szw/vim-maximizer'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'racer-rust/vim-racer', {'for': 'rust'}
call plug#end()
filetype plugin on
syntax off

set ignorecase
set smartcase

let g:ale_completion_enabled = 1
map F <Plug>(snipe-F)
map f <Plug>(snipe-f)
map T <Plug>(snipe-T)
map t <Plug>(snipe-t)

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

set relativenumber
set nomodeline
set t_ut=
runtime macros/matchit.vim
set encoding=utf-8
set fileencoding=utf-8
set nowrap
set sidescroll=1

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

let g:ale_lint_on_save = 1
let g:ale_python_flake8_executable = 'python3'

let g:ale_sass_stylelint_use_global = 1

let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'go': ['go build', 'gofmt'],
\   'typescript': ['tslint', 'tsserver'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}

let g:ale_javascript_prettier_options = '--no-semi --single-quote'

" Completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" TODO: Remove once glass mayhem is done
let g:EditorConfig_disable_rules = ['max_line_length']

let g:maximizer_default_mapping_key = '<C-F>'
let g:tern_show_argument_hints='on_hold'

au BufNewFile,BufRead *.handlebars set filetype=mustache
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir
au BufRead,BufNewFile *.rs set filetype=rust
let g:racer_cmd = "/Users/mat/.cargo/bin/racer"
set background=dark

" Tabs as 4 spaces
set tabstop=2
set shiftwidth=2
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


colorscheme preto

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[6 q"
    let &t_EI = "\<Esc>[2 q"
endif

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
endif

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


command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <leader>/ :Ag 
nnoremap <leader>p :GFiles <cr>
nnoremap <leader>o :Files <cr>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" incsearch plugin mappings, enable highlighting etc
autocmd InsertEnter * :set nohlsearch

nnoremap <leader>t :TagbarToggle<CR>
" Reselect visual mode selection after shift
vnoremap > >gv
vnoremap < <gv

" Airline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'

" Weird hack to enable alt keys in konsole
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeoutlen=1000
set ttimeoutlen=0

" Enable emmet with leader key
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key=','

let g:acp_enableAtStartup = 0
set laststatus=2

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions

let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"

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

" Don't clutter current directory with Vim tmp-files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set undofile
set undolevels=1000
set undoreload=10000

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
hi Normal ctermbg=none



" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
