set nocompatible              " required
set number
filetype plugin off             " required
syntax enable
set wildmenu


" Global settings for all files (but may be overridden in ftplugin).
set tabstop=2
set shiftwidth=2
set noexpandtab
set termguicolors
" search
set incsearch
set hlsearch
"nnoremap <CR> :nohlsearch<CR>

colorscheme solarized
" allow find commmand go recursively
set path +=**

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'cmirallesp/vim-task'
Plugin 'Solarized'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'lervag/vimtex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
"*************SNIPETS***********************
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"*************Airline powerline**************
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1

"******* FILE BROWSING****************************
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"*************MAP*******************************
" return to visual mode after indent in vm
vnoremap > >gv
vnoremap < <gv

" go to buffer
nnoremap gb :ls<CR>:b<Space>

" tags navigation
nnoremap <C-P> <C-]>

map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

