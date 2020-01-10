set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

set rtp+=/home/koeus/.vim/bundle/Vundle.vim
" Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'sjl/badwolf'
" Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " requied
set exrc
set secure
set mouse-=a
augroup project
  autocmd!
  autocmd BufRead, BufNewFile *.h, *.c set filetype=c.doxygen
augroup end
" CtrlP
nnoremap <leader>p :CtrlP<CR>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Color
colorscheme badwolf
syntax enable
" Spaces and Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" UI Config
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
" Search
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" Movement
nnoremap j gj
nnoremap k gk
nnoremap  <leader>f  $
nnoremap  <leader>q  0
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h
" Leader shortcut
let mapleader=" "
imap jj <Esc>
" Autogroup
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" Organistaion 
set modelines=1
