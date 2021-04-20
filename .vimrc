" vimrc file of maherme

set nocompatible

" Plugins Installed
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tpope/vim-fugitive'
"For using Gbrowse in fugitive: "
Plug 'tpope/vim-rhubarb'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ronakg/quickr-cscope.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'dracula/vim',{'as':'dracula'}
call plug#end()

" For showing number of line
set number

" For remapping leader key
let mapleader = ","

" For showing hidden characters
set listchars=eol:$,space:.,nbsp:_,tab:>-,trail:~,extends:>,precedes:<
set list

" For replacing tab with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" For setting the color scheme
colorscheme dracula

" For setting a right appearance of airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
set t_Co=256

" For viewing buffers in airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Setting statusline for airline:
" For viewing git branch using vim-fugitive
set statusline=%{FugitiveStatusline()}
" For kite
set statusline=%{kite#statusline()}

" For starting NERDTree automatically with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" For opening NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>

" For showing hidden files in NERDTree
let NERDTreeShowHidden=1

" Supported languages for kite
let g:kite_supported_languages = ['python']

" coc
autocmd FileType python let b:coc_suggest_disable = 1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type_definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for scrolling autocomplete menu
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" For switching between header and implementation file
map <silent> <C-s> ::CocCommand clangd.switchSourceHeader<CR>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Use <c-space> to trigger completion
if &filetype == "python"
    inoremap <C-space> <C-x><C-u>
else
    inoremap <silent><expr> <C-space> coc#refresh()
endif
