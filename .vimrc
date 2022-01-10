filetype plugin indent on
syntax on

" vim-plug
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" plugin section

Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdtree'
Plug 'dylanaraps/wal'
Plug 'mhinz/vim-startify'
" Plug 'ying17zi/vim-live-latex-preview', {'for': 'tex'}

"end vim-plug
call plug#end()

colorscheme wal

set wildmenu
set backspace=indent,eol,start
set number relativenumber
set mouse=a
set laststatus=2
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" Enable folding
set foldmethod=indent
set foldlevel=99
"set spell
set spelllang=es,en

autocmd Filetype tex setl updatetime=1
"let g:livepreview_previewer = 'zathura'

let g:lightline = {
			\'colorscheme': 'wombat',
			\}

let g:startify_header_image = '/home/leinad/Imágenes/eromanga.png'

let g:startify_lists = [
            \ { 'type': 'files', 'header': [] },
            \ ]

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

map <C-n> :NERDTreeToggle<CR>

" Last line
set noshowmode
set showcmd
