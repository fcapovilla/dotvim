call plug#begin('~/.vim/plugged')
Plug 'bitc/vim-bad-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'vim-scripts/LargeFile'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'preservim/tagbar'
Plug 'gko/vim-coloresque'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tommcdo/vim-exchange'
Plug 'mhinz/vim-signify'
Plug 'mg979/vim-visual-multi'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mattn/emmet-vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-html-css-support', {'do': 'yarn install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install --frozen-lockfile && yarn prepack'}
call plug#end()

" Filetypes (for snippets)
au BufNewFile,BufRead *.twig set ft=htmljinja
au BufNewFile,BufRead *.textile set ft=textile
au BufNewFile,BufRead *.tt set ft=tt2html.html.javascript
au BufNewFile,BufRead *.html set ft=html.javascript
au BufNewFile,BufRead *.htm set ft=html.javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
filetype plugin indent on

" Read odt, sxw, doc and pdf files in vim
au BufReadPre *.doc set ro
au BufReadPost *.doc %!antiword "%"

au BufReadPre *.odt,*.sxw set ro
au BufReadPost *.odt,*.sxw %!odt2txt --width=-1 "%"

au BufReadPre *.pdf set ro
au BufReadPost *.pdf %!pdftotext "%" -

" Color Scheme
let g:solarized_italics=0
let g:solarized_old_cursor_style=1
let g:solarized_termtrans=1
let g:solarized_use16=1
set background=dark
colorscheme solarized8

" Plugins config
let g:ale_disable_lsp = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 100000
let g:ctrlp_show_hidden = 1
if has("unix")
    let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp'
elseif has("win32")
    let g:ctrlp_cache_dir = '$HOME/vimfiles/tmp/ctrlp'
endif

vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Basic config
set nocompatible
set modelines=0
set colorcolumn=120

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


" Statusline
set laststatus=2

" Editor config
"set cursorline
"set visualbell
"set relativenumber
set number
syntax on
set showcmd
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif
set tabpagemax=50
set scrolloff=5
set listchars=tab:▸\ ,eol:¬

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab

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

" Button mapping
inoremap jj <esc>
nnoremap <Space> za

map <F5> :NERDTreeTabsToggle<cr>
vmap <F5> <esc>:NERDTreeTabsToggle<cr>
imap <F5> <esc>:NERDTreeTabsToggle<cr>

map <F6> :CtrlP<cr>
vmap <F6> <esc>:CtrlP<cr>
imap <F6> <esc>:CtrlP<cr>

map <F7> :bprevious<cr>
vmap <F7> <esc>:bprevious<cr>
imap <F7> <esc>:bprevious<cr>

map <F8> :bnext<cr>
vmap <F8> <esc>:bnext<cr>
imap <F8> <esc>:bnext<cr>

map <S-F5> :UndotreeToggle<cr>
vmap <S-F5> <esc>:UndotreeToggle<cr>
imap <S-F5> <esc>:UndotreeToggle<cr>

map <S-F6> :CocSearch 
vmap <S-F6> <esc>:CocSearch 
imap <S-F6> <esc>:CocSearch 

map <S-F7> :SignifyToggle<cr>
vmap <S-F7> <esc>:SignifyToggle<cr>
imap <S-F7> <esc>:SignifyToggle<cr>

map <S-F8> :TagbarToggle<cr>
vmap <S-F8> <esc>:TagbarToggle<cr>
imap <S-F8> <esc>:TagbarToggle<cr>

" Disable arrows
"inoremap  <up>     <nop>
"inoremap  <down>   <nop>
"inoremap  <left>   <nop>
"inoremap  <right>  <nop>
"noremap   <up>     <nop>
"noremap   <down>   <nop>
"noremap   <left>   <nop>
"noremap   <right>  <nop>

" Text bubbling
"map <up> ddkp
"map <down> ddp
"imap <up> <esc>ddkpi
"imap <Down> <esc>ddpi
"vmap <up> dkp`[v`]
"vmap <Down> dp`[V`]

if filereadable(glob("~/.vim/vimrc.local"))
    so ~/.vim/vimrc.local
endif

if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat^=%f:%l:%c:%m
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


" === CoC Configuration ===

call coc#config('suggest.autoTrigger', 'none')

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
