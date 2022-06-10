
" remap arrow keys
noremap ; l
noremap l k
noremap k j
noremap j h

inoremap jj <Esc>
" for practice only
" inoremap <Esc> <NOP>

" fix delete action
set backspace=indent,eol,start

" line numbers
set number

" syntax highlighting
syntax enable 

" colorscheme
try
    colorscheme desert
catch
endtry

" show matching brackets
set showmatch

" use spaces instead of tabs
set expandtab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" ingore case when searching
set ignorecase

" highlight search
set hlsearch

" incremental search
set incsearch

" display cursor line
set cursorline

" unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>:<backspace>

" automatic indentantion
set autoindent

" enable filetype plugins
filetype plugin on
filetype indent on

" encoding
set encoding=utf-8

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" F9 to run current python buffer
" https://stackoverflow.com/questions/18948491/running-python-code-in-vim#18948530
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


""""""""""""""""""""""""""""""
"""   PLUGINS
""""""""""""""""""""""""""""""

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Nvim-R
Plug 'jalvesaq/Nvim-R'
" Nvim-R options
let R_pdfviewer = "evince"
let R_openpdf = 1

" VimCompleteMe
Plug 'ajh17/VimCompletesMe'

" Jedi python auto completation
Plug 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0  " avoid popup when typing `.`
let g:jedi#show_call_signatures = "1"  " change call signatures position

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> 
let g:UltiSnipsExpandTrigger = "<S-tab>"

" NERD Tree
Plug 'preservim/nerdtree'
" Ctrl+n NT shortcut
map <C-n> :NERDTreeToggle<CR>

" Syntastic syntax checking plugin
Plug 'vim-syntastic/syntastic'

:command Sc :SyntasticCheck
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_c_check_header = 1
let g:syntastic_c_config_file = '.syntastic_c_config'

" Git diff
Plug 'airblade/vim-gitgutter'

call plug#end()

