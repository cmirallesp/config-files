" PYTHON
" uncomment next line if you use python2
let g:python_host_prog = '/Users/carles/.pyenv/versions/2.7/bin/python'
let g:python3_host_prog = '/Users/carles/.pyenv/versions/3.6.2/bin/python'
"set runtimepath+=~/.config/nvim/plugins/deoplete.nvim
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
set number
" Global settings for all files (but may be overridden in ftplugin).
set tabstop=2
set shiftwidth=2
" colors
set termguicolors "True colors
set background=dark
colorscheme NeoSolarized

" search
"set incsearch
"set hlsearch

" allow find commmand go recursively
set path +=**
"plugins
call plug#begin('~/.vim/plugged')
Plug 'cmirallesp/vim-task' 
Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'md'}
Plug 'mzlogin/vim-markdown-toc',{'for': 'md'}
Plug 'tpope/vim-sensible' "tabs, configuration
"command line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" latex-box (lighter than latex-vim)
Plug 'LaTeX-Box-Team/LaTeX-Box' 

" autocomplete & snipets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive' "Git plugin
Plug 'mileszs/ack.vim' "Front-end to ack searcher
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat' " format files
" pyton autocompletion (jedi)
Plug 'zchee/deoplete-jedi'
" js autocompletion (tern)
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

let g:deoplete#enable_at_startup=1
"let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"

"*************SNIPETS***********************
imap <F3>     <Plug>(neosnippet_expand_or_jump)
smap <F3>    <Plug>(neosnippet_expand_or_jump)
xmap <F3>    <Plug>(neosnippet_expand_target)
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

" terminal map escape
:tnoremap <Esc> <C-\><C-n>

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
" remove trailing spaces on save
autocmd BufWritePre *.py :%s/\s\+$//e
" run Neoformat on save
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
"autocmd CompleteDone * pclose " To close preview window of deoplete aut
