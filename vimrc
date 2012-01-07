"pathogen
filetype off
call pathogen#helptags()
filetype plugin indent on
call pathogen#runtime_append_all_bundles()

"Filetypes (for snippets)
au BufNewFile,BufRead *.csv set ft=csv
au BufNewFile,BufRead *.php set ft=php.html.javascript
au BufNewFile,BufRead *.tt set ft=tt2html.html.javascript
au BufNewFile,BufRead *.html set ft=html.javascript
au BufNewFile,BufRead *.htm set ft=html.javascript

"Color Scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_italic=0
set background=dark
colorscheme solarized

"plugins config
"let g:Perl_PerlTags = 'on'
let g:SuperTabDefaultCompletionType = "context"
let g:ctrlp_map = '<f6>'
let g:ctrlp_persistent_input = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 0
let g:ctrlp_cache_dir = '~/.vim/tmp'
let g:ctrlp_dotfiles = 1
let g:svndiff_autoupdate = 1

"basic config
set nocompatible
set modelines=0

"code completion config
set complete-=i

"persistent undo
if has("persistent_undo")
    if has("unix")
        set undodir=~/.vim/undo
    elseif has("win32")
        set undodir=$HOME/vimfiles/undo
    endif
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"keep swap files in $home and keep backups
set backup
set backupdir=~/.vim/tmp
set dir=~/.vim/tmp

"corrects a backspace problem with the perl-support plugin
set bs=indent,eol,start

"statusline
set statusline=%<%F%m%r%h%w\ %y\ A=\%b\ H=\%b\ %{&fenc}
set statusline+=%=\ (%l,%c)\ %P
set statusline+=\ %{fugitive#statusline()}
set laststatus=2
"if version >= 700
"  au insertenter * hi statusline ctermfg=1 ctermbg=0
"  au insertleave * hi statusline ctermfg=7 ctermbg=0
"endif

"editor config
"set cursorline
"set visualbell
"set relativenumber
set number
syntax on
set showcmd
set mouse=a
set tabpagemax=50
set scrolloff=5
set listchars=tab:â–¸\ ,eol:Â¬

"indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab

"search
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

"where to find the tags file
set tags=tags;~

"make :find do recursive searchs
"set path+=**

"button mapping
inoremap jj <esc>

map <F5> :NERDTreeTabsToggle<cr>
vmap <F5> <esc>:NERDTreeTabsToggle<cr>
imap <F5> <esc>:NERDTreeTabsToggle<cr>

map <S-F5> :GundoToggle<cr>
vmap <S-F5> <esc>:GundoToggle<cr>
imap <S-F5> <esc>:GundoToggle<cr>

"map <F6> :FufCoverageFile<cr>
"vmap <F6> <esc>:FufCoverageFile<cr>
"imap <F6> <esc>:FufCoverageFile<cr>

map <S-F6> :TagbarToggle<cr>
vmap <S-F6> <esc>:TagbarToggle<cr>
imap <S-F6> <esc>:TagbarToggle<cr>

map <F7> :bprevious<cr>
vmap <F7> <esc>:bprevious<cr>
imap <F7> <esc>:bprevious<cr>

map <S-F7> :call Svndiff("next")<cr>
vmap <S-F7> <esc>:call Svndiff("next")<cr>
imap <S-F7> <esc>:call Svndiff("next")<cr>

map <F8> :bnext<cr>
vmap <F8> <esc>:bnext<cr>
imap <F8> <esc>:bnext<cr>

map <S-F8> :!perl -d:ptkdb %<cr>
vmap <S-F8> <esc>:!perl -d:ptkdb %<cr>
imap <S-F8> <esc>:!perl -d:ptkdb %<cr>

"disable arrows
inoremap  <up>     <nop>
inoremap  <down>   <nop>
inoremap  <left>   <nop>
inoremap  <right>  <nop>
"noremap   <up>     <nop>
"noremap   <down>   <nop>
"noremap   <left>   <nop>
"noremap   <right>  <nop>

"text bubbling
"map <up> ddkp
"vmap <up> dkp`[v`]
"imap <up> <esc>ddkpi

"map <down> ddp
"vmap <Down> dp`[V`]
"imap <Down> <esc>ddpi

"Macro Commentaire Libeo
let @l = 'dO100i#o# Libeo - o$€kb# Libeo - o100i#o€ku€ku€kuo€kup€kuo€kup`[v`]\cc'

