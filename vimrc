" Pathogen
filetype off
call pathogen#helptags()
filetype plugin indent on
call pathogen#runtime_append_all_bundles()

" Correction vim-gutter pour éviter les flicker
sign define file_start text=o texthl=FileStart
au BufNewFile,BufRead * exe "sign place 999999 line=1 name=file_start file=" . expand("%:p")

" Filetypes (for snippets)
au BufNewFile,BufRead *.csv set ft=csv
au BufNewFile,BufRead *.twig set ft=htmljinja
au BufNewFile,BufRead *.tt set ft=tt2html.html.javascript
au BufNewFile,BufRead *.html set ft=html.javascript
au BufNewFile,BufRead *.htm set ft=html.javascript
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Read odt, sxw, doc and pdf files in vim
au BufReadPre *.doc set ro
au BufReadPost *.doc %!antiword "%"

au BufReadPre *.odt,*.sxw set ro
au BufReadPost *.odt,*.sxw %!odt2txt --width=-1 "%"

au BufReadPre *.pdf set ro
au BufReadPost *.pdf %!pdftotext "%" -

" Color Scheme
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_italic=0
set background=dark
colorscheme solarized

" Plugins config
"let g:Perl_PerlTags = 'on'
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:SuperTabDefaultCompletionType = "context"
let g:ctrlp_map = '<f6>'
let g:ctrlp_persistent_input = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 0
let g:ctrlp_dotfiles = 1
if has("unix")
    let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp'
elseif has("win32")
    let g:ctrlp_cache_dir = '$HOME/vimfiles/tmp/ctrlp'
endif
let g:gitgutter_enabled = 0

vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Basic config
set nocompatible
set modelines=0

" Code completion config
set complete-=i

" Persistent undo
if has("persistent_undo")
    if has("unix")
        set undodir=~/.vim/tmp/undo
    elseif has("win32")
        set undodir=$HOME/vimfiles/tmp/undo
    endif
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Keep swap files in $home and keep backups
set backup
if has('unix')
    set backupdir=~/.vim/tmp/backup
    set directory=~/.vim/tmp/swp
elseif has("win32")
    set backupdir=$HOME/vimfiles/tmp/backup
    set directory=$HOME/vimfiles/tmp/swp
endif

" Corrects a backspace problem with the perl-support plugin
set bs=indent,eol,start

" Statusline
set statusline=%<%F%m%r%h%w\ %y\ A=\%b\ H=\%b\ %{&fenc}
set statusline+=%=\ (%l,%c)\ %P
set statusline+=\ %{fugitive#statusline()}
set laststatus=2

" Editor config
"set cursorline
"set visualbell
"set relativenumber
set number
syntax on
set showcmd
set mouse=a
set ttymouse=xterm2
set tabpagemax=50
set scrolloff=5
set listchars=tab:â–¸\ ,eol:Â¬

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
"set expandtab

" Search
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Where to find the tags file
set tags=tags;~

" Make :find do recursive searchs
"set path+=**

" Button mapping
inoremap jj <esc>

map <F5> :NERDTreeTabsToggle<cr>
vmap <F5> <esc>:NERDTreeTabsToggle<cr>
imap <F5> <esc>:NERDTreeTabsToggle<cr>

map <S-F5> :GundoToggle<cr>
vmap <S-F5> <esc>:GundoToggle<cr>
imap <S-F5> <esc>:GundoToggle<cr>

map <S-F6> :TagbarToggle<cr>
vmap <S-F6> <esc>:TagbarToggle<cr>
imap <S-F6> <esc>:TagbarToggle<cr>

map <F7> :bprevious<cr>
vmap <F7> <esc>:bprevious<cr>
imap <F7> <esc>:bprevious<cr>

map <S-F7> :GitGutterToggle<cr>
vmap <S-F7> <esc>:GitGutterToggle<cr>
imap <S-F7> <esc>:GitGutterToggle<cr>

map <F8> :bnext<cr>
vmap <F8> <esc>:bnext<cr>
imap <F8> <esc>:bnext<cr>

" Disable arrows
inoremap  <up>     <nop>
inoremap  <down>   <nop>
inoremap  <left>   <nop>
inoremap  <right>  <nop>
"noremap   <up>     <nop>
"noremap   <down>   <nop>
"noremap   <left>   <nop>
"noremap   <right>  <nop>

" Text bubbling
"map <up> ddkp
"vmap <up> dkp`[v`]
"imap <up> <esc>ddkpi
"map <down> ddp
"vmap <Down> dp`[V`]
"imap <Down> <esc>ddpi

" Macros
" Commentaire Libeo Perl
let @l = 'dO100i#o# Libeo - o$€kb# Libeo - o100i#o€ku€ku€kuo€kup€kuo€kup`[v`]\cc'
" Builder Vibeo
let @w = ':w:!python ~/www/mediaelement/src/Builder.py'

if filereadable(glob("~/.vim/vimrc.local"))
	so ~/.vim/vimrc.local
endif
