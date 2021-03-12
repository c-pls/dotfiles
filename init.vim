function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'

Plug 'NLKNguyen/papercolor-theme'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'preservim/nerdcommenter'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'shougo/deoplete.nvim'

Plug 'deoplete-plugins/deoplete-jedi'

Plug 'tpope/vim-surround'

Plug 'tell-k/vim-autopep8'

Plug 'ap/vim-css-color'

Plug 'ghifarit53/tokyonight-vim'

Plug 'mhartington/oceanic-next'

Plug 'altercation/vim-colors-solarized'

Plug 'slim-template/vim-slim'

Plug 'majutsushi/tagbar'

Plug 'chiel92/vim-autoformat'

Plug 'yggdroot/indentline'

Plug 'vim-scripts/indentpython.vim'

"Plug 'davidhalter/jedi-vim'

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
set cursorline       "highlight the line of the cursor
"set cursorcolumn     "hilight the column of the cursor
set nowrap      "no line wrapping

set termguicolors

"colorscheme dracula


" Config for paper color theme
" set background=light
"colorscheme PaperColor

" Config for oceanic theme
"colorscheme OceanicNext

"Config  Tokyo night style
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
let g:airline_theme = "tokyonight"
let g:tokyonight_transparent_background = 1

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
let g:multi_cursor_start_key='<c-n>'
let g:multi_cursor_next_key='<tab>'
let g:multi_cursor_prev_key='b'
let g:multi_cursor_skip_key='x'
let g:multi_cursor_quit_key='q'


"Running python code directly
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"Autoformat
let g:formatterpath = ['/some/path/to/a/folder', '/home/superman/formatters']

noremap <Space> :Autoformat<CR>
au BufWrite * :Autoformat

"Tag bar
nmap <F8> :TagbarToggle<CR>

"Deoplete
let g:deoplete#enable_at_startup = 1
