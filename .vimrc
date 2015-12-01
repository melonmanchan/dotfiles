set nocompatible
filetype off
syntax on
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Ternjs/tern_for_vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'dkprice/vim-easygrep'
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'sheerun/vim-polyglot'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tomasr/molokai'
call vundle#end()

let NERDTreeShowHidden=1

let g:polyglot_disabled = ['css', 'scss']
let g:tern_show_argument_hints='on_hold'
filetype plugin indent on

au BufNewFile,BufRead *.handlebars set filetype=mustache

colorscheme 256-grayvim
" Tabs as 4 spaces
set tabstop=4
set shiftwidth:4
set expandtab

" Space as mapleader
let mapleader = " "

" Show tabs as a character
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

" Mousemode on!
set mouse=a

" Set my preferred colorscheme
" colors 256-grayvim
" Show linenumbers by default
set number

" Make backspace delete empty
set backspace=indent,eol,start

" Set default shell as regular ol bash
set shell=/bin/bash

" No weird ex mode, please!
nnoremap Q <nop>

" Map moving to command mode as jk, since reaching for ESC is for suckers!
inoremap jk <Esc>
inoremap JK <Esc>

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

" Airline fonts
let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_css_checkers = ['csslint']
let g:syntastic_scss_checkers = ['sass']

let g:closetag_filenames = "*.html,*.htm,*.moustache"

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Set up CtrlP related stuff, ignore git folders and nodejs node_modules in
" results
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|git\|www\|platforms\|plugins'

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
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#disable_auto_complete = 1
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Git
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gl :Gpull<CR>

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
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

