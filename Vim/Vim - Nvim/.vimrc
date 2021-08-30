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

" Vim Fugitive
Plugin 'tpope/vim-fugitive'                                                     

" Vim Emmet
Plugin 'mattn/emmet-vim'

" Vim Jedi
Plugin 'davidhalter/jedi-vim'

" JSON Vim
Plugin 'elzr/vim-json'


" Vim monokai
Plugin 'tomasr/molokai'
" Color scheme inspired by Atom's One Dark syntax theme
Plugin 'joshdick/onedark.vim'
" Preview colors in source code while editing
Plugin 'ap/vim-css-color'
" Oceanic theme
Plugin 'mhartington/oceanic-next'
"Autopep8
Plugin 'tell-k/vim-autopep8'
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
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

let g:ncm2#matcher = 'substrfuzzy'

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'


"Tagbar"
Plug 'majutsushi/tagbar'

" Vim tokyo-night style
Plug 'ghifarit53/tokyonight-vim'

" Vim visual multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Ayu-vim color scheme
Plug 'ayu-theme/ayu-vim'

" Paper color theme
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

"Enable tagbar on startup"
autocmd FileType py call tagbar#autoopen(0)

"  ******       Config for color scheme
"
"
set termguicolors

" Config Dracula theme
"colorscheme dracula

" Config Monokai colorscheme
"let g:molokai_original = 1
"colorscheme monokai

" Config  Tokyo night style
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
"let g:airline_theme = "tokyonight"
"let g:tokyonight_transparent_background = 0

"Config Ayu color scheme
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"Config Oceanic-Next color scheme
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'

" Config for paper color theme
set background=light
colorscheme PaperColor

"Set color for the commnent
hi Comment ctermfg=31 guifg=#0087af 
"hi Comment ctermfg=34 guifg=#00af00
"hi Comment ctermfg=46 guifg=#00ff00 "rgb=0,255,0


" *********End of config color scheme from here ****
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
"let g:pymode_lint_ignore = ["C0301","C0114","C0115"]
"let g:pymode_lint_checkers = ["pylint"]
"let g:pymode_rope = 0
"let g:pymode_lint_write = 0       "turn off running pylint on file save
"Enable pymode indentation
"let g:pymode_indent = 1
"let g:pymode_lint_write = 0       "turn off running pylint on file save
"let mapleader = ","
"nnoremap <leader>p :PyLint<cr>    "pressing ,p will run plyint on current buffer



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

"Auto pep8 map F8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"Disable show diff window
let g:autopep8_disable_show_diff=1

"Automatically format everytime saving a file
let g:autopep8_on_save = 1
"Running python code directly
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
