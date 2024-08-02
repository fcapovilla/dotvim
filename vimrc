call plug#begin('~/.vim/plugged')
" Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'puremourning/vimspector'
Plug 'madox2/vim-ai'
" Mappings
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'mg979/vim-visual-multi'
Plug 'nelstrom/vim-visual-star-search'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'mattn/emmet-vim'
" UI
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'bitc/vim-bad-whitespace'
Plug 'gko/vim-coloresque'
Plug 'wincent/terminus'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'adelarsq/vim-emoji-icon-theme'
" Other
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/LargeFile'
Plug 'jasonccox/vim-wayland-clipboard', {'tag': 'v0.1.0'}
Plug 'honza/vim-snippets'
call plug#end()

let g:coc_global_extensions = [
\ 'coc-lists',
\ 'coc-git',
\ 'coc-css',
\ 'coc-html',
\ 'coc-html-css-support',
\ 'coc-yaml',
\ 'coc-json',
\ 'coc-tsserver',
\ '@yaegassy/coc-volar',
\ 'coc-solargraph',
\ '@yaegassy/coc-intelephense',
\ 'coc-blade',
\ 'coc-sh',
\ 'coc-pyright',
\ 'coc-elixir',
\ 'coc-snippets',
\ 'coc-flutter',
\]

" Basic configuration
set encoding=utf-8
set nocompatible
set modelines=0
set colorcolumn=120
set complete-=i
set lazyredraw
set laststatus=2
set number
set scrolloff=0
set listchars=tab:▸\ ,eol:¬
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
syntax on
if !has('nvim')
    set ttymouse=xterm2
endif

" Button mappings
vnoremap <Enter> <Plug>(EasyAlign)

nnoremap gs <plug>(GrepperOperator)
xnoremap gs <plug>(GrepperOperator)

inoremap jj <esc>

nnoremap <Space> <Nop>
let mapleader=" "

noremap <C-h> <C-w><Left>
noremap <C-j> <C-w><Down>
noremap <C-k> <C-w><Up>
noremap <C-l> <C-w><Right>
noremap <C-w><C-Left> <C-w><Left>
noremap <C-w><C-Down> <C-w><Down>
noremap <C-w><C-Up> <C-w><Up>
noremap <C-w><C-Right> <C-w><Right>
map <leader>y "+y

function! FernToggleFind()
    if filereadable(expand('%'))
        Fern . -drawer -reveal=%
    else
        Fern . -drawer -toggle
    endif
endfunction

noremap <leader><Space> <esc>:CtrlPMRUFiles<cr>
noremap <leader>f <esc>:Files<cr>
noremap <leader>t <esc>:call FernToggleFind()<cr>
noremap <leader>u <esc>:UndotreeToggle<cr>
noremap <leader>g <esc>:Grepper<cr>
noremap <leader>l <esc>:CocList<cr>
noremap <leader>d <esc>:CocList -I --input=<C-r><C-w> symbols<cr>

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
hi link CocCodeLens Comment

" Plugin configuration
runtime plugin/grepper.vim
let g:grepper.tools = ['rg', 'ag', 'grep']
let g:grepper.ag.grepprg .= ' --follow'
let g:grepper.rg.grepprg .= ' --follow --no-ignore-vcs --hidden --no-messages -M 1000 --glob=!.git/'
let g:grepper.prompt_text = '$t> '
let g:grepper.prompt_quote = 2
let g:grepper.highlight = 1
let g:grepper.stop = 5000

let g:coc_snippet_next = '<tab>'

let g:ale_disable_lsp = 1
let g:ale_virtualtext_cursor = 0

let g:DevIconsEnableFolderPatternMatching = 0

let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 100000
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = {
\ 'ToggleType(1)': ['<c-f>', '<c-up>', '<tab>'],
\ 'PrtExpandDir()': ['<c-tab>'],
\}
if has("unix")
    let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp'
    let g:fzf_history_dir = '~/.vim/tmp/fzf-history'
elseif has("win32")
    let g:ctrlp_cache_dir = '$HOME/vimfiles/tmp/ctrlp'
    let g:fzf_history_dir = '$HOME/vimfiles/tmp/fzf-history'
endif
let g:fzf_layout = { 'down': '30%' }

let g:fern#renderer = "devicons"
let g:fern#default_hidden = 1
let g:fern#drawer_width = 40
let g:fern#disable_drawer_hover_popup = 1
let g:fern_renderer_devicons_disable_warning = 1
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1

function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand:stay)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
  nmap <buffer><nowait> <cr> <Plug>(fern-my-expand-or-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-expand-or-collapse)
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:edit-or-split)
  nmap <buffer> dd <Plug>(fern-action-remove)
  nmap <buffer> N <Plug>(fern-action-new-path)
  nmap <buffer> b <Plug>(fern-action-open:below)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> S <Plug>(fern-action-grep)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

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

" If available, use Ag or Rg for searches
if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep\ --follow\ --no-messages\ $*
    let g:ctrlp_user_command = 'rg %s --files --color=never --no-ignore-vcs --follow --no-messages --glob ""'
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ --follow\ $*
    let g:ctrlp_user_command = 'ag %s -l --nocolor --skip-vcs-ignores --follow -g ""'
endif
set grepformat^=%f:%l:%c:%m

" Local configuration file
if filereadable(glob("~/.vim/vimrc.local"))
    so ~/.vim/vimrc.local
endif

" === CoC Configuration ===

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
