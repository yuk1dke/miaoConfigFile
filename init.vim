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
"set incsearch
"set ignorecase
set smartcase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8

let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set cindent
set list
set listchars=tab:▸\ ,trail:▫
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
map <leader>r :call ComplieRunGcc()<cr>
"map <leader>tm :call isAtStartOfLine<cr>

"inoremap ' ''<esc>i
"inoremap "" ""<esc>i
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
"inoremap { {}<esc>i

map <leader>p "+p
map <leader>y "+y
nnoremap <del> <c-6>

nnoremap L <C-w>l
nnoremap K <C-w>k
nnoremap H <C-w>h
nnoremap J <C-w>j

let g:table_mode_motion_up_map = '<s-up>'
let g:table_mode_motion_down_map = '<s-down>'
let g:table_mode_motion_left_map = '<s-left>'
let g:table_mode_motion_right_map = '<s-right>'

"nnoremap <s-up> :res +1<cr>
"nnoremap <s-down> :res -1<cr>
"nnoremap <s-left> :vertical resize-1<cr>
"nnoremap <s-right> :vertical resize+1<cr>

nnoremap co :s/\([^     ]\)/\/\* \1/<cr>:s/[    ]*$/ \*\//<cr>:nohlsearch<cr>
nnoremap con :s/\/\*[   ]*//<cr>:s/[    ]*\*\/ *$//<cr>:nohlsearch><cr>
nmap cu :s/^/\/\//<cr>:nohlsearch<cr>
nmap cun :s/\/\///<cr>:nohlsearch<cr>
nmap cu :s/^/\/\//<cr>:nohlsearch<cr>
nmap cun :s/\/\///<cr>:nohlsearch<cr>
"map at <esc>O//@@@<esc>o
"map AT <esc>O//@@@<esc>j

map tu :tabe<cr>
map tn :-tabnext<cr>
map ti :+tabnext<cr>

"let &t_SI = "\<Esc>50;CursorShape=1\x7"
"let &t_SR = "\<Esc>50;CursorShape=2\x7"
let &t_EI = "\<Esc>50;CursorShape=0\x7"

cnoremap vimrc vsp ~/.config/nvim/init.vim<cr>
cnoremap bashrc vsp ~/.bashrc<cr>
cnoremap sss vsp /root/.local/share/nvim/site/plugged/vim-snippets/UltiSnips<cr>
"map <leader>tag :set<space>tags=./tags,<space>./..tags,<space>./*/tags<cr>
cmap space g/^\s*$/d<cr>
cmap ass %s/^\s*\..*//<cr>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <leader><space> :nohlsearch<cr>
"cnoremap co s#^\([    ]*\)[^     ]\([^  ]*\)$#\1\/\* \2 \*\/#<space><cr> :nohlsearch<cr>



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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/c.vim'
Plug 'rhysd/vim-clang-format'
Plug 'luochen1990/rainbow'
Plug 'bitterjug/vim-tagbar-ctags-elm'
Plug 'vim-scripts/taglist.vim'
Plug 'valloric/ycmd'
Plug 'scrooloose/nerdtree'

" snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'junegunn/vim-peekaboo' " paste manager
Plug 'ncm2/ncm2' " complete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi' " python complete 
Plug 'ncm2/ncm2-path' " path complete
Plug 'ncm2/ncm2-github' " path complete
Plug 'ncm2/ncm2-match-highlight' " 
Plug 'ncm2/ncm2-bufword' " word complete
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python highlight
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'peterhoeg/vim-qml'

call plug#end()

set laststatus=2 "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
let g:airline_theme='gruvbox'

" snippets
"source ~/.config/nvim/md-snippets.vim
autocmd BufRead,BufNewFile *.md setlocal spell " auto spell

" ultisnips
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<pageUp>"
let g:UltiSnipsJumpForwardTrigger="<pageUp>"
let g:UltiSnipsJumpBackwardTrigger="<pagedown>"
"let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
let g:UltiSnipsSnippetDirectories = [$HOME.'/.local/share/nvim/site/plugged/vim-snippets/UltiSnips', "UntiSnips"]

silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" markdown
let g:vim_markdown_folding_disabled = 1
"set nofoldenable
let g:vim_markdown_override_foldtext = 0


" MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
"let g:mkdp_echo_preview_url = 0
let g:mkdp_browser = 'google-chrome'
"let g:mkdp_browser = 'firefox-esr'
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" table-mode
let g_table_mode_corner = '|'
"let g:table_mode_align_char
"nnoremap <leader>tr :let g:table_mode_relign_map<cr>

" run
func! ComplieRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -g % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        silent! exec "!clear"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!chromium % --no-sandbox &"
    elseif &filetype == 'markdown'
        exec ":MarkdownPreview"
    elseif &filetype == 'qml'
        exec "!qmlscene %"
    endif
endfunc

" table-mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
