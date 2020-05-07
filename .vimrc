syntax on
set number
set ts=2
let g:netrw_banner = 0
let g:netrw_altv=1
"===== Remap netrw window nav ====="
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
set nocompatible              " be iMproved, required
filetype off                  " required

"======= VUNDLE ========"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"""""  Airline """"""""""""
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"""""  NerdTree """"""""""""
Plugin 'preservim/nerdtree'
"""""  CtrlP """"""""""""
Plugin 'kien/ctrlp.vim'
"""""" Edge """"""""""""
Plugin 'sainnhe/edge' 

call vundle#end()            " required
filetype plugin indent on    " required

""" CtrlP """""
let g:ctrlp_show_hidden=1
""" Color Scheme """"
set termguicolors
set background=dark
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
colorscheme edge
let g:airline_theme='edge'
""" Mappings ""
let g:ctrlp_map = '<c-p>' " Map CtrlP
map <C-n> :NERDTreeToggle<CR>
inoremap ii <Esc>
map <Leader>o o<Esc>
map <Leader>O O<Esc>
