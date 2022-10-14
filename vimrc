call plug#begin('~/.vim/plugged')
Plug 'bitc/vim-bad-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'vim-scripts/LargeFile'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lifepillar/vim-solarized8'
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
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'mhinz/vim-grepper'
Plug 'honza/vim-snippets'
Plug 'wincent/terminus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-html',
\ 'coc-html-css-support',
\ 'coc-yaml',
\ 'coc-json',
\ 'coc-tsserver',
\ '@yaegassy/coc-volar',
\ 'coc-solargraph',
\ 'coc-phpls',
\ 'coc-blade',
\ 'coc-sh',
\ 'coc-jedi',
\ 'coc-elixir',
\ 'coc-snippets',
\]

" Filetypes (for snippets)
au BufNewFile,BufRead *.twig set ft=htmljinja
au BufNewFile,BufRead *.textile set ft=textile
au BufNewFile,BufRead *.tt set ft=tt2html.html.javascript
au BufNewFile,BufRead *.html set ft=html.javascript
au BufNewFile,BufRead *.htm set ft=html.javascript
au BufNewFile,BufReadPost *.md set filetype=markdown
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
runtime plugin/grepper.vim
let g:grepper.tools = ['ag', 'rg', 'grep']
let g:grepper.ag.grepprg .= ' --follow'
let g:grepper.rg.grepprg .= ' --follow'
let g:grepper.prompt_quote = 2
let g:ale_disable_lsp = 1
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 100000
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_mruf_relative = 1
let g:NERDTreeMinimalMenu=1
if has("unix")
    let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp'
elseif has("win32")
    let g:ctrlp_cache_dir = '$HOME/vimfiles/tmp/ctrlp'
endif

vmap <Enter> <Plug>(EasyAlign)

" Basic config
set nocompatible
set modelines=0
set colorcolumn=120

" Code completion config
set complete-=i

" Persistent undo
if has("persistent_undo")
    if has("unix")
        if has('nvim')
            set undodir=~/.vim/tmp/nvim_undo
        else
            set undodir=~/.vim/tmp/undo
        endif
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
set number
syntax on
set showcmd
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif
set tabpagemax=50
set scrolloff=0
set listchars=tab:▸\ ,eol:¬

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab

" Search
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

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nmap <A-Up> <C-W><Up>
nmap <A-Down> <C-W><Down>
nmap <A-Left> <C-W><Left>
nmap <A-Right> <C-W><Right>

function! NERDTreeToggleFind()
    if filereadable(expand('%'))
        NERDTreeFind
    elseif exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    else
        NERDTree
    endif
endfunction

map <F5> <esc>:call NERDTreeToggleFind()<cr>
imap <F5> <esc>:call NERDTreeToggleFind()<cr>

map <F6> <esc>:CtrlPMRUFiles<cr>
imap <F6> <esc>:CtrlPMRUFiles<cr>

map <F7> <esc>:Grepper<cr>
imap <F7> <esc>:Grepper<cr>

map <F8> <esc>:CocList<cr>
imap <F8> <esc>:CocList<cr>

map <S-F5> <esc>:UndotreeToggle<cr>
imap <S-F5> <esc>:UndotreeToggle<cr>

map <S-F6> <esc>:CtrlP<cr>
imap <S-F6> <esc>:CtrlP<cr>

map <S-F7> <esc>:ALEToggle<cr>
imap <S-F7> <esc>:ALEToggle<cr>

map <S-F8> <esc>:TagbarToggle<cr>
imap <S-F8> <esc>:TagbarToggle<cr>

if filereadable(glob("~/.vim/vimrc.local"))
    so ~/.vim/vimrc.local
endif

if executable('ag')
    set grepprg=ag\ --vimgrep\ --follow\ $*
    set grepformat^=%f:%l:%c:%m
    let g:ctrlp_user_command = 'ag %s -l --nocolor --skip-vcs-ignores --follow -g ""'
endif


" === CoC Configuration ===

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

let g:coc_snippet_next = '<tab>'

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
