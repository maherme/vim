" vimrc file of maherme

set nocompatible

" Plugins Installed
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tpope/vim-fugitive'
"For using Gbrowse in fugitive: "
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'dracula/vim',{'as':'dracula'}
call plug#end()

" For showing number of line
set number

" For setting the color scheme
colorscheme dracula

"Setting for right appearance of airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
set t_Co=256

" For showing hidden characters
set listchars=eol:$,space:.,nbsp:_,tab:>-,trail:~,extends:>,precedes:<
set list

" For starting NERDTree automatically with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"For opening NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>

"For showing hidden files in NERDTree
let NERDTreeShowHidden=1

"For replace tab with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"For viewing git branch using vim-fugitive
set statusline=%{FugitiveStatusline()}
