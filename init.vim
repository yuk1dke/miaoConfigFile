"leader
let mapleader=","

syntax on
colorscheme gruvbox

"set
set mouse=a
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"set encoding=utf-8

let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set cindent
"set list
"set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map <leader>b :source ~/.config/nvim/init.vim<cr>

"inoremap ' ''<esc>i
"inoremap " ""<esc>i
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
inoremap { {}<esc>i

map <leader>p "+p
map <leader>y "+y

map sl :set splitright<cr>:vsplit<cr>
map sh :set nosplitright<cr>:vsplit<cr>
map sj :set nosplitbelow<cr>:split<cr>
map sk :set splitbelow<cr>:split<cr>

map L <C-w>l
map K <C-w>k
map H <C-w>h
map J <C-w>j

map <up> :res +1<cr>
map <down> :res -1<cr>
map <left> :vertical resize-1<cr>
map <right> :vertical resize+1<cr>

map co :s/\([^     ]\)/\/\* \1/<cr>:s/[    ]*$/ \*\//<cr><leader><space>
map nco :s/\/\*[   ]*//<cr>:s/[    ]*\*\/ *$//<cr><leader><space>
"map at <esc>O//@@@<esc>o
"map AT <esc>O//@@@<esc>j

map tu :tabe<cr>
map tn :-tabnext<cr>
map ti :+tabnext<cr>

"let &t_SI = "\<Esc>50;CursorShape=1\x7"
"let &t_SR = "\<Esc>50;CursorShape=2\x7"
let &t_EI = "\<Esc>50;CursorShape=0\x7"

cmap vimrc vsp ~/.config/nvim/init.vim<cr>
cmap bashrc vsp<space>~/.bashrc<cr>
"map <leader>tag :set<space>tags=./tags,<space>./..tags,<space>./*/tags<cr>
cmap space g/^\s*$/d<cr>
cmap ass %s/^\s*\..*//<cr>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <leader><space> :nohlsearch<cr>
"cnoremap co s#^\([    ]*\)[^     ]\([^  ]*\)$#\1\/\* \2 \*\/#<space><cr> :nohlsearch<cr>


"call plug#begin('~/.vim/plugged')
"
"" Undo Tree
"Plug 'mbbill/undotree/'
"
"" Auto Complete
"Plug 'Valloric/YouCompleteMe'
"
"
"call plug#end()
"
"
"
"
""
""Plug 'vim-airline/vim-airline'
""Plug 'connorholyday/vim-snazzy'
""
""" File navigation
""Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
""Plug 'Xuyuanp/nerdtree-git-plugin'
""
""" Taglist
""Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
""
""" Error checking
""Plug 'w0rp/ale'
""
""
""
""" Other visual enhancement
""Plug 'nathanaelkane/vim-indent-guides'
""Plug 'itchyny/vim-cursorword'
""
""" Git
""Plug 'rhysd/conflict-marker.vim'
""Plug 'tpope/vim-fugitive'
""Plug 'mhinz/vim-signify'
""Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
""
""" HTML, CSS, JavaScript, PHP, JSON, etc.
""Plug 'elzr/vim-json'
""Plug 'hail2u/vim-css3-syntax'
""Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
""Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
""Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
""Plug 'mattn/emmet-vim'
""
""" Python
""Plug 'vim-scripts/indentpython.vim'
""
""" Markdown
""Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
""Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
""Plug 'vimwiki/vimwiki'
""
""" Bookmarks
""Plug 'kshenoy/vim-signature'
""
""" Other useful utilities
""Plug 'terryma/vim-multiple-cursors'
""Plug 'junegunn/goyo.vim' " distraction free writing mode
""Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
""Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
""Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
""Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
""
""" Dependencies
""Plug 'MarcWeber/vim-addon-mw-utils'
""Plug 'kana/vim-textobj-user'
""Plug 'fadein/vim-FIGlet'

"complete
let g:cpp_class_scope_hightlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_hightlight = 1
let g:cpp_no_function_highlight = 1

"rainbow"
let g:rainbow_active = 1 "set to 0 if you want to enable it later via:RainBowToggle

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'vim-airline/vim-airline'
"Plug 'connorholyday/vim-snazzy'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme'
Plug 'vim-scripts/c.vim'
Plug 'rhysd/vim-clang-format'
Plug 'luochen1990/rainbow'
Plug 'bitterjug/vim-tagbar-ctags-elm'
Plug 'vim-scripts/taglist.vim'
Plug 'valloric/ycmd'
Plug 'scrooloose/nerdtree'

call plug#end()

set laststatus=2 "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
let g:airline_theme='gruvbox'
