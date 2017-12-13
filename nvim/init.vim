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
Plug 'mileszs/ack.vim' "Front-end to ack searcher
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat' " format files
" pyton autocompletion (jedi)
Plug 'zchee/deoplete-jedi'
" js autocompletion (tern)
" javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'marijnh/tern_for_vim'
Plug 'othree/jspc.vim'
Plug 'flowtype/vim-flow'

" ....
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'terryma/vim-multiple-cursors'
Plug 'neomake/neomake'
" open fuzzy files
Plug '/usr/local/opt/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/vim-easy-align'
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
"
"
"
"**************FLOW-QUICKFIX
function! StrTrim(txt)
	return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:neomake_javascript_enabled_makers = ['flow']

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
	let g:neomake_javascript_flow_maker = {
				\ 'exe': 'sh',
				\ 'args': ['-c', g:flow_path.' --json 2> /dev/null | flow-vim-quickfix'],
				\ 'errorformat': '%E%f:%l:%c\,%n: %m',
				\ 'cwd': '%:p:h'
				\ }
	let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'flow']
endif

" This is kinda useful to prevent Neomake from unnecessary runs
if !empty(g:neomake_javascript_enabled_makers)
	autocmd! BufWritePost * Neomake
endif

"""""""""""""""""
" Tern settings
"""""""""""""""""
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" markdown table format
au FileType markdown vmap <leader><Bslash> :EasyAlign*<Bar><Enter>
au FileType markdown.pandoc vmap <leader><Bslash> :EasyAlign*<Bar><Enter>
