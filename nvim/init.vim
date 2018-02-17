" PYTHON
" uncomment next line if you use python2
let g:python_host_prog = '/Users/carles/.pyenv/versions/2.7/bin/python'
let g:python3_host_prog = '/Users/carles/.pyenv/versions/3.6.2/bin/python'
"set runtimepath+=~/.config/nvim/plugins/deoplete.nvim
let mapleader=","
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
set number

" change buffer without saving
set hidden

" Global settings for all files (but may be overridden in ftplugin).
set tabstop=2
set shiftwidth=2
" colors
set termguicolors "True colors
set background=dark
colorscheme NeoSolarized

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>
" search
"set incsearch
"set hlsearch

" allow find commmand go recursively
set path +=**
set shell=/usr/local/bin/zsh
"plugins
call plug#begin('~/.vim/plugged')
Plug 'cmirallesp/vim-task'
"Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'md'}
Plug 'mzlogin/vim-markdown-toc'
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
"Plug 'mileszs/ack.vim' "Front-end to ack searcher
Plug 'epmatsw/ag.vim' "silver searcher
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat' " format files
Plug 'zchee/deoplete-jedi' " pyton autocompletion (jedi)
" js autocompletion (tern)
" javascript
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plug 'marijnh/tern_for_vim'
"Plug 'othree/jspc.vim'
"Plug 'flowtype/vim-flow'

" ....
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'neomake/neomake'
" open fuzzy files
Plug '/usr/local/opt/fzf'
Plug 'junegunn/vim-easy-align'
Plug	'elmcast/elm-vim'
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'
Plug 'vim-ctrlspace/vim-ctrlspace'
call plug#end()

let g:deoplete#enable_at_startup=1
autocmd CompleteDone * pclose " To close preview window of deoplete aut
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
let g:ackprg = 'ag --vimgrep'

" terminal map escape
:tnoremap <Esc> <C-\><C-n>

" open with fuzzy finder
nnoremap ff :FZF<cr>
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

" open file browser
nnoremap ,, :e .<CR>

" copy paste through pbcopy
map <C-c> :.w !pbcopy<CR><CR>
map <C-v> :r !pbpaste<CR>
map <space> :CtrlSpace<CR>
"
"

