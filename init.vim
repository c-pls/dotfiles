function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'

Plug 'sheerun/vim-polyglot'

Plug 'NLKNguyen/papercolor-theme'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'morhetz/gruvbox'

Plug 'preservim/nerdcommenter'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'shougo/deoplete.nvim'

Plug 'deoplete-plugins/deoplete-jedi'

Plug 'tpope/vim-surround'

Plug 'ap/vim-css-color'

Plug 'ghifarit53/tokyonight-vim'

Plug 'mhartington/oceanic-next'

Plug 'altercation/vim-colors-solarized'

Plug 'slim-template/vim-slim'

Plug 'majutsushi/tagbar'

Plug 'yggdroot/indentline'

Plug 'vim-scripts/indentpython.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vimjas/vim-python-pep8-indent'

Plug 'mattn/emmet-vim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'scrooloose/nerdtree'

call plug#end()


" Fundamental settings
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax on

set smartindent
set expandtab         "tab to spaces
set tabstop=2         "the width of a tab
set shiftwidth=2      "the width for indent
set foldenable
set foldmethod=indent "folding by indent
set foldlevel=99
set ignorecase        "ignore the case when search texts
set smartcase

set number           "line number
"set cursorline       "highlight the line of the cursor
"set cursorcolumn     "hilight the column of the cursor
set nowrap      "no line wrapping

set termguicolors

"colorscheme dracula

set bg=dark
colorscheme gruvbox

" Config for paper color theme
"set background=light
"colorscheme PaperColor

"Config for oceanic theme
"colorscheme OceanicNext

"Config  Tokyo night style
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
"let g:airline_theme = "tokyonight"
"let g:tokyonight_transparent_background = 1

"  set background=light
"colorscheme solarized


"Set color for the commnent
"hi Comment ctermfg=31 guifg=#0087af
"hi Comment ctermfg=34 guifg=#00af00
hi Comment ctermfg=46 guifg=#00ff00 "rgb=0,255,0


"Map jj to ESC"
inoremap jj <ESC>

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <C-k> <c-w>k<CR>
nnoremap <silent> <C-j> <c-w>j<CR>
nnoremap <silent> <C-h> <c-w>h<CR>
nnoremap <silent> <C-l> <c-w>l<CR>

set splitbelow
set splitright
" Multi_cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<ctrl-shift-l>'
let g:multi_cursor_next_key='<tab>'
let g:multi_cursor_prev_key='b'
let g:multi_cursor_skip_key='x'
let g:multi_cursor_quit_key='q'


"Running python code directly
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

let g:python_pep8_indent_multiline_string=0
let python_pep8_indent_hang_closing = 1

"Tag bar
nmap <F8> :TagbarToggle<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" For autoformat mostly use for JS 
nmap <F11> :Prettier<CR>

highlight NvimTreeFolderIcon guibg=blue
map <C-m> :NERDTreeToggle<CR> 
map <C-f> :NERDTreeFind<CR> 

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <C-k> <c-w>k<CR>
nnoremap <silent> <C-j> <c-w>j<CR>
nnoremap <silent> <C-h> <c-w>h<CR>
nnoremap <silent> <C-l> <c-w>l<CR>

" Map emmet
let g:user_emmet_leader_key=','
let g:user_emmet_mode='n'

nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
