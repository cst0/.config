" *** basic general functionality
set shell=/bin/bash
set encoding=utf-8
set spelllang=en_us
set nocompatible
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

set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set gdefault

set colorcolumn=120

" *** Plugins
call plug#begin('~/.config/nvim/vimplug')
    "Plug 'https://github.com/mickaobrien/vim-stackoverflow'
    Plug 'RRethy/vim-hexokinase'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'andymass/vim-matchup'
    Plug 'anufrievroman/vim-angry-reviewer'
    Plug 'flazz/vim-colorschemes'
    Plug 'godlygeek/tabular'
    Plug 'gotcha/vimpdb'
    Plug 'itchyny/calendar.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'lervag/vimtex'
    Plug 'markonm/traces.vim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
    Plug 'rhysd/vim-grammarous'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/bufpos'
    Plug 'vimwiki/vimwiki'
    Plug 'wellle/context.vim'
    Plug 'yggdroot/indentline'
    Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
    Plug 'github/copilot.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'stevearc/vim-arduino'
    Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
    "Plug 'taketwo/vim-ros'
    "Plug 'vim-vdebug/vdebug'
    "Plug 'honza/vim-snippets'
    "Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " neat, but seems to break the cursorconceal features
    "Plug 'SirVer/ultisnips'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'chrisbra/unicode.vim'
    "Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'dense-analysis/ale'
    "Plug 'fholgado/minibufexpl.vim'
    "Plug 'lervag/vimtex', {'tag': 'v1.6'}
    "Plug 'luochen1990/rainbow'
    "Plug 'tpope/vim-endwise'
    "Plug 'tpope/vim-speeddating'
    "Plug 'xolox/vim-notes'
    "Plug 'ycm-core/YouCompleteMe'
call plug#end()
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-marketplace',
    \ ]
"    \ 'coc-snippets',
"    \ 'coc-pyright',
" some plugins not in this list:
" serves the same purpose of nerdtree:
"    \ 'coc-explorer',

" *** Individual Plugin Settings
" ** airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline_minimalist_showmod = 1
let g:airline#extensions#ale#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{MyStatusLine()}'

" arduino
let g:arduino_use_cli = 0
let g:arduino_dir = '/usr/share/arduino/hardware/arduino'
let g:arduino_home_dir = '/home/cst/.arduino15'

" ** coc
set hidden
set cmdheight=2
set updatetime=500
set shortmess+=c
set signcolumn=yes

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" scroll through possible tab-completed suggestions
inoremap <expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : "\<c-j>"
inoremap <expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<c-k>"

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : '\<cr>'
" observe the changed quotes! ^^
inoremap <expr> <c-l> coc#pum#visible() ? coc#pum#confirm() : "\<c-l>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" use {g and }g to navigate grammar errors
nmap <silent> {g <Plug>(grammarous-move-to-previous-error)
nmap <silent> }g <Plug>(grammarous-move-to-next-error)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> <leader>m :call <SID>show_documentation()<CR>

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

" angry-reviewer
let g:AngryReviewerEnglish = 'american'
nnoremap <leader>ar :AngryReviewer<cr>

"" coc-snippets
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<tab>'

" ** ctrl-p
" ctrlp remapping
"let g:ctrlp_map = '<C-f>'
" nnoremap <Leader>f :CtrlPBufTagAll<CR>

"" ** gitgutter
"let g:gitgutter_sign_added = '▌'
"let g:gitgutter_sign_modified = '▌'
"let g:gitgutter_sign_removed = '▌'
"let g:gitgutter_sign_modified_removed = '∙'

" ** copilot
let g:copilot_filetypes = {
      \ 'md': v:false,
      \ 'tex': v:false,
      \ 'wiki': v:false,
      \ }

" ** easymotion
nmap <Leader>e <Plug>(easymotion-bd-f)
let g:EasyMotion_smartcase = 1


" ** hexokinase
set termguicolors

" ** limelight
let g:limelight_conceal_ctermfg = 'darkgray'

" ** NERDTree
let NERDTreeShowHiddenFiles = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore=[
            \    '^build$',
            \    '^node_modules$',
            \    '\.o$',
            \    '\.a$',
            \    '\.so$',
            \    '\.class$',
            \    '\.pyc$',
            \    '\.swp$',
            \    '\.swo$',
            \    '\.swx$',
            \    '\.aux$',
            \    '\.bbl$',
            \    '\.blg$',
            \    '\.fdb_latexmk$',
            \    '\.fls$',
            \    '\.log$',
            \    '\.pdf$',
            \    '\.synctex.gz$',
            \    '\.png$',
            \    '\.jpg$',
            \    '\.jpeg$',
            \    '\.gif$',
            \    '\.bmp$',
            \    '\.tiff$',
            \    '\.tif$',
            \    ]

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
let g:tex_flavor='xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" mildly aggressive concealing, but if we enter the line, drop the conceal
set conceallevel=2
set concealcursor=c

let g:tex_conceal='abdmg'

" ** vimwiki
let g:vimwiki_list = [
            \ {'path': '~/vimwiki/','auto_tags':1}
            \ ]

" wtf is this? cterm is for terminal colors, am I concealing it for theming
" reasons?
hi Conceal ctermbg=none

" *** Custom Keybindings
" trying out space as leader in normal mode (without actually overwriting it)
nmap <space> \
vmap <space> \

" folding
"nnoremap <space> za
"vnoremap <space> zf

" Spelling/highlight
" [s]pell [c]heck
noremap <silent> <Leader>sc z=<CR>
" [s]pell [g]ood
noremap <silent> <Leader>sg zg<CR>
" [s]top [h]ighlight
noremap <silent> <Leader>sh :noh<CR>
" [s]ort [s]election
vnoremap <silent> <Leader>ss :'<,'>sort<CR>
" [s]trip [w]hitespace
noremap <silent> <Leader>sw :StripWhitespace<CR>

" Ctrl-backspace backspaces over an entire word
inoremap <C-BS> <C-W>
" make ctrl-backspace work in terminal
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" if I fumble these I don't want to hear about it
nmap Q <silent>
nmap q: <silent>
nmap qw <silent>

"" W now writes as root (per https://vim.fandom.com/wiki/Su-write)
"command W w !sudo tee "%" > /dev/null

map <C-n> :NERDTreeToggle<CR>
noremap <silent> <Leader>n :NERDTreeToggle<CR>

if exists(":Tagbar")
    nmap <silent> <C-t> :Tagbar<CR>
    noremap <silent> <Leader>t :Tagbar<CR>
endif
" buffer stuff
" buffer nav
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

map <Leader>j <C-w>j
map <Leader>h <C-w>h
map <Leader>k <C-w>k
map <Leader>l <C-w>l

" del active buffer
noremap <silent> <Leader>q :bd<CR>
noremap <silent> <Leader>Q :bd!<CR>

" buffer resizing via leader keys in standard increments
nmap <Leader>< 20<C-w><
nmap <Leader>> 20<C-w>>

" send to background (instead of ^z for the same function)
noremap <silent> <Leader>z <C-z>

" As much as I hate to say it, the mouse isn't always bad. So here's how we
" can enable/disable that...
"nmap <leader>me :set mouse=n<CR>
"nmap <leader>md :set mouse=<CR>
" but i'm not using it and this slows down doc page checks


" activate Tabularize on a handful of different keys
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,\zs<CR>
  vmap <Leader>a, :Tabularize /,\zs<CR>
endif

if exists(":RainbowToggle")
    noremap <silent> <Leader>r :RainbowToggle<CR>
endif

" handy ROS hack: treat launch file as xml
autocmd BufNewFile,BufRead *.launch set syntax=xml

" :[range]SortGroup[!] [n|f|o|b|x] /{pattern}/
" e.g. :SortGroup /^header/
" e.g. :SortGroup n /^header/
" See :h :sort for details

function! s:sort_by_header(bang, pat) range
  let pat = a:pat
  let opts = ""
  if pat =~ '^\s*[nfxbo]\s'
    let opts = matchstr(pat, '^\s*\zs[nfxbo]')
    let pat = matchstr(pat, '^\s*[nfxbo]\s*\zs.*')
  endif
  let pat = substitute(pat, '^\s*', '', '')
  let pat = substitute(pat, '\s*$', '', '')
  let sep = '/'
  if len(pat) > 0 && pat[0] == matchstr(pat, '.$') && pat[0] =~ '\W'
    let [sep, pat] = [pat[0], pat[1:-2]]
  endif
  if pat == ''
    let pat = @/
  endif

  let ranges = []
  execute a:firstline . ',' . a:lastline . 'g' . sep . pat . sep . 'call add(ranges, line("."))'

  let converters = {
        \ 'n': {s-> str2nr(matchstr(s, '-\?\d\+.*'))},
        \ 'x': {s-> str2nr(matchstr(s, '-\?\%(0[xX]\)\?\x\+.*'), 16)},
        \ 'o': {s-> str2nr(matchstr(s, '-\?\%(0\)\?\x\+.*'), 8)},
        \ 'b': {s-> str2nr(matchstr(s, '-\?\%(0[bB]\)\?\x\+.*'), 2)},
        \ 'f': {s-> str2float(matchstr(s, '-\?\d\+.*'))},
        \ }
  let arr = []
  for i in range(len(ranges))
    let end = max([get(ranges, i+1, a:lastline+1) - 1, ranges[i]])
    let line = getline(ranges[i])
    let d = {}
    let d.key = call(get(converters, opts, {s->s}), [strpart(line, match(line, pat))])
    let d.group = getline(ranges[i], end)
    call add(arr, d)
  endfor
  call sort(arr, {a,b -> a.key == b.key ? 0 : (a.key < b.key ? -1 : 1)})
  if a:bang
    call reverse(arr)
  endif
  let lines = []
  call map(arr, 'extend(lines, v:val.group)')
  let start = max([a:firstline, get(ranges, 0, 0)])
  call setline(start, lines)
  call setpos("'[", start)
  call setpos("']", start+len(lines)-1)
endfunction
command! -range=% -bang -nargs=+ SortGroup <line1>,<line2>call <SID>sort_by_header(<bang>0, <q-args>)
