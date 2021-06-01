" *** basic general functionality
set shell=/bin/bash
set encoding=utf-8
set spelllang=en_us
set spell

set title
set number
set ruler
set nowrap
set linebreak
set showmatch
set wildmenu
set wildmode=longest:full,full

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

"set formatoption+=o

set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set gdefault

set colorcolumn=120

" *** Plugins
call plug#begin('~/.config/nvim/vimplug')
    ""Plug 'airblade/vim-gitgutter' %
    Plug 'andymass/vim-matchup'
    Plug 'luochen1990/rainbow'
    Plug 'chrisbra/unicode.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    ""Plug 'dense-analysis/ale'     %
    ""Plug 'fholgado/minibufexpl.vim'%
    Plug 'flazz/vim-colorschemes'
    Plug 'godlygeek/tabular'
    Plug 'itchyny/calendar.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'lervag/vimtex'
    "Plug 'lervag/vimtex', {'tag': 'v1.6'}
    "Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    Plug 'markonm/traces.vim'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
    Plug 'RRethy/vim-hexokinase'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-speeddating'
    "Plug 'honza/vim-snippets'
    "Plug 'SirVer/ultisnips'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/bufpos'
    Plug 'vimwiki/vimwiki'
    Plug 'wellle/context.vim'
    ""Plug 'xolox/vim-notes'        %
    Plug 'Xuyuanp/nerdtree-git-plugin'
    ""Plug 'ycm-core/YouCompleteMe' %
    Plug 'yggdroot/indentline'
call plug#end()

" *** Individual Plugin Settings
" ** airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline_minimalist_showmod = 1
let g:airline#extensions#ale#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ** coc
set hidden
set cmdheight=2
set updatetime=1000
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nmap <leader>ff <Plug>(coc-format)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

" ** colorschemes
set background=dark
colorscheme gruvbox

" coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ** ctrl-p
" ctrlp remapping
"let g:ctrlp_map = '<C-f>'
nnoremap <Leader>f :CtrlPBufTagAll<CR>

"" ** gitgutter
"let g:gitgutter_sign_added = '▌'
"let g:gitgutter_sign_modified = '▌'
"let g:gitgutter_sign_removed = '▌'
"let g:gitgutter_sign_modified_removed = '∙'

" ** limelight
let g:limelight_conceal_ctermfg = 'darkgray'

" ** rainbow
let g:rainbow_active = 0

" *** Custom Functions
" Allow \w to create 'wrap mode', where text wraps and
" j -> gj, etc
" Modified to use ctrl-j, originally from
" https://vim.fandom.com/wiki/Move_cursor_by_display_lines_when_wrapping
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    :Goyo!
    :Limelight!
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <C-k>
    silent! nunmap <buffer> <C-j>
    silent! nunmap <buffer> <C-0>
    silent! nunmap <buffer> <C-$>
    silent! iunmap <buffer> <C-k>
    silent! iunmap <buffer> <C-j>
    silent! iunmap <buffer> <C-0>
    silent! iunmap <buffer> <C-$>
  else
    echo "Wrap ON"
    :Goyo 65%
    :Limelight
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <C-k> gk
    noremap  <buffer> <silent> <C-j> gj
    noremap  <buffer> <silent> <C-0> g<Home>
    noremap  <buffer> <silent> <C-$> g<End>
    inoremap <buffer> <silent> <C-k> <C-o>gk
    inoremap <buffer> <silent> <C-j> <C-o>gj
    inoremap <buffer> <silent> <C-0> <C-o>g<Home>
    inoremap <buffer> <silent> <C-$> <C-o>g<End>
  endif
endfunction

noremap <silent> <Leader>p :call Preamble()<CR>
function Preamble()
    r~/.vim/snippets/gplv3
endfunction

" ** vimtex
let g:vimtex_syntax_enabled=0
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0

let g:tex_conceal='abdmg'

hi Conceal ctermbg=none

" *** Custom Keybindings
" folding
nnoremap <space> za
vnoremap <space> zf

" Ctrl-backspace backspaces over an entire word
inoremap <C-BS> <C-W>
" make ctrl-backspace work in terminal
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

nmap Q <silent>
nmap q: <silent>
nmap qw <silent>

" W now writes as root (per https://vim.fandom.com/wiki/Su-write)
command W w !sudo tee "%" > /dev/null

" plugin activation
map <C-n> :NERDTreeToggle<CR>
map <C-t> :Tagbar<CR>

map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <silent> <Leader>r :RainbowToggle<CR>
" handy ROS hack: treat launch file as xml
autocmd BufNewFile,BufRead *.launch set syntax=xml


