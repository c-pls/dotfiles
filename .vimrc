syntax enable
syntax on

set number relativenumber
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
set clipboard=unnamedplus
set ttimeoutlen=50
set cursorline
set wildmenu
filetype plugin indent on

"Vim Vundle config
set nocompatible        " be iMproved, required                           
filetype off            " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required                                            
Plugin 'VundleVim/Vundle.vim'   

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'                                                     
Plugin 'mattn/emmet-vim'


call vundle#end()            " required
filetype plugin indent on    " required












"Plugin Install"
call plug#begin('~/.vim/autoload')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:ncm2#matcher = 'substrfuzzy'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

"Autocomplete python"
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

"Tagbar"
Plug 'majutsushi/tagbar'

call plug#end()

"Enable tagbar on startup"
autocmd FileType py call tagbar#autoopen(0)


set termguicolors
colorscheme dracula

"Map jj to ESC" 
inoremap jj <ESC>

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <C-k> <c-w>k<CR>
nnoremap <silent> <C-j> <c-w>j<CR>
nnoremap <silent> <C-h> <c-w>h<CR>
nnoremap <silent> <C-l> <c-w>l<CR>

"NERDTreeToggle 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <Leader>f :NERDTreeToggle<Enter>

map <C-n> :NERDTreeToggle<CR>


autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Ignore warning python-mode
let g:pymode_lint_ignore = ["C0301", "C0114", "C0115"]
let g:pymode_lint_checkers = ["pylint"]
let g:pymode_rope = 0


"YouCompleteMe 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:user_emmet_leader_key='<C-Z>'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_openframeworks.py"
