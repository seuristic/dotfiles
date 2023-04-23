let mapleader = " "

set nocompatible
set number
set hlsearch 
set ignorecase
set smartcase 
set noerrorbells
set belloff=esc
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set nowrap
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap 
set noswapfile
set mouse=a
set clipboard=unnamed
set showmatch
set termguicolors
set splitright splitbelow
set list lcs=tab:\¦\ 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

inoremap jk <ESC>
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-clang-format'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
let g:lightline = { 
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'right': [['lineinfo'],['percent'],['filetype']],
      \ },
      \ }
colorscheme material

let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden = 1

let g:clang_format#auto_format = 1
let g:clang_format#auto_filetypes = ["c", "cpp"]

let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.cpp PrettierAsync

map <leader>e :NERDTreeToggle<cr>
nnoremap <C-p> :Files<cr>

if exists("##VimResized")
    if &diff
        au VimResized * wincmd =
    endif
endif

" autocmd BufWinLeave ?* mkview
" autocmd BufWinEnter ?* silent loadview

map <S-F9> :!clear && g++ -DLOCAL -std=c++17 -O2 % && ./a.out && rm a.out <CR>

let g:session_autosave = 'no'
let g:session_autoload = 'no'
