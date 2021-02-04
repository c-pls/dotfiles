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

Plugin 'tpope/vim-fugitive'                                                     
Plugin 'mattn/emmet-vim'
Plugin 'davidhalter/jedi-vim'

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

set splitbelow
set splitright


"NERDTreeToggle 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <Leader>f :NERDTreeToggle<Enter>

map <C-m> :NERDTreeToggle<CR>


autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Ignore warning python-mode
let g:pymode_lint_ignore = ["C0301", "C0114", "C0115"]
let g:pymode_lint_checkers = ["pylint"]
let g:pymode_rope = 0


" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 1

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'

"Disable the signature
let g:jedi#show_call_signatures = 0
""""""When you start typing `from module.name<space>` jedi-vim automatically
"can add the"import" statement and trigger the autocompletion popup.
let g:jedi#smart_auto_mappings = 1


"Running python code directly
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
