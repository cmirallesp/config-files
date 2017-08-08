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
Plugin 'vimwiki'
Plugin 'JamshedVesuna/vim-markdown-preview'
call vundle#end()            " required
filetype plugin indent on    " required

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

" comment/uncomment
noremap + :s/^/\/\//<CR>
noremap - :s/\/\///<CR>

" go to buffer
nnoremap gb :ls<CR>:b<Space>

" tags navigation
nnoremap <TAB> <C-]>
nnoremap <S-TAB> <C-O>

map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
