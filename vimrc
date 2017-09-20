set nocompatible              " required
set number
filetype plugin off             " required
syntax enable
set wildmenu
set wildmenu

" Global settings for all files (but may be overridden in ftplugin).
set tabstop=2
set shiftwidth=2
set noexpandtab
set termguicolors
set background=dark
" search
set incsearch
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"nnoremap <CR> :nohlsearch<CR>


" allow find commmand go recursively
set path +=**

" set the run time path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'cmirallesp/vim-task'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'mzlogin/vim-markdown-toc'
"command line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" latex-box (lighter than latex-vim)
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" autocomplete & snipets
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Activate deoplete by default
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"Git plugin
Plugin 'tpope/vim-fugitive'
"Front-end to ack searcher
Plugin 'mileszs/ack.vim'
call vundle#end()            " required

filetype plugin indent on    " required
colorscheme NeoSolarized
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
" Default to tree mode
let g:netrw_liststyle = 3
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=0  " open in prior window
let g:netrw_altv=0          " no open splits to the right
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview=1
"let g:netrw_winsize = 25
"let g:netrw_fastbrowse    = 2
"let g:netrw_keepdir       = 0
"let g:netrw_liststyle     = 3
"let g:netrw_retmap        = 1
"let g:netrw_silent        = 1
"let g:netrw_special_syntax= 1
set autochdir
map <C-E> :e.<CR>
"*************MAP*******************************
" return to visual mode after indent in vm
vnoremap > >gv
vnoremap < <gv

" go to buffer
nnoremap gb :ls<CR>:b<Space>

" tags navigation
nnoremap <C-+> <C-]>
inoremap <C-s> <ESC>:w<CR> 

map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>
let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"

"*********SPELL*****************
setlocal spelllang=en_us
set spell
" next/prev error
nmap as ]s
nmap sa [s
" suggestions
nmap ss z=
nmap 1s 1z=
" add ass good word into personal dictionary
nmap sd zG

let g:tex_flavor='latex'
let g:ycm_path_to_python_interpreter = '/Users/carles/.pyenv/shims/python'

