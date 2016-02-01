" Be true vimmers and ensure nocompatible
set nocompatible

" Automatic reload of vimrc
autocmd! bufwritepost vimrc source %

" Turned on later necessary for some plugins
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Open Files with fuzzy search
Plugin 'kien/ctrlp.vim'
" Configurable context sensitive Statusline
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" PluginCollection for python developement
Plugin 'klen/python-mode'
" Pytest Plugin
Plugin 'alfredodeza/pytest.vim'
" Outine variable and functions
Plugin 'taglist.vim'
" Insane git integration
Plugin 'tpope/vim-fugitive'
" Browse files on your system
Plugin 'scrooloose/nerdtree.git'
" Work with 'surroundings'
Plugin 'tpope/vim-surround'
" Repeat functions provided by plugins
Plugin 'tpope/vim-repeat'
" Snippets
Plugin 'SirVer/ultisnips'

" ColorSchemes
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

call vundle#end()

" set leader key, increase timeout and show if leader is active
let mapleader=","
set timeout timeoutlen=1500
set showcmd

" make backspace normal
set bs=2

""""""""""""""""
" Key bindings "
""""""""""""""""
" Quicksave
"" noremap <C-Y> :update<CR>
"" vnoremap <C-Y> <C-C>:update<CR>
"" inoremap <C-Y> <C-O>:update<CR>

" Quick exit
noremap <Leader>e :quit<C-R>	" Quit current window
noremap <Leader>E :qa!<C-R>	" Quit all windows

" bind Ctrl+<movement> keys to move around windows instead of using Crtl+w+<movement>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" remove highlight from last search
noremap <C-N> :nohl<CR>
vnoremap <C-N> :nohl<CR>
inoremap <C-N> :nohl<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks (dont loses selection)
vnoremap < <gv
vnoremap > >gv

" Open Outline (Taglist)
map <silent><Leader>o <esc>:TlistToggle<CR>

" Open NERDTree
map <silent><Leader>p <esc>:NERDTreeToggle<CR>

" folding
set nofoldenable
nnoremap <Leader>f za
nnoremap <Leader>F zA

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" PyTest shortcuts
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tp <Esc>:Pytest project<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" show trailing whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Colorscheme
set background=dark
" colorscheme desert
" colorscheme slate
" colorscheme slate
" colorscheme monokai
colorscheme molokai
" colorscheme solarized

" Language Support
filetype indent plugin on
syntax on

" Window size
" Use ~x on an English Windows version or ~n for French.
autocmd GUIEnter * simalt ~x
set columns=80
set lines=40

" Diable beep and flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" show line numbers
set number
set relativenumber
set nowrap      " Don't automatically wrap on load
set fo-=t       " Don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233 guibg=#434e56


" useful settings
set history=700
set undolevels=700

" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" disable backups and swapfiles (especially usefule for file system watchers)
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""
" Plugin Config "
"""""""""""""""""
" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" ctrlp (open files with fuzzy search
" git clone https://github.com/kien/ctrlp.vim
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" python-mode
map <Leader>g :call RopeGotoDefinition()<C-R>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

" Open TagList on the right site
let Tlist_Use_Right_Window = 1
