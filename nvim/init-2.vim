let g:python3_host_prog='/Users/cmiralle/.pyenv/versions/3.9.0/bin/python'
let mapleader=","
set runtimepath+=~/.vim,~/.vim/after,/usr/local/opt/fzf
set packpath+=~/.vim
" change buffer without saving
set hidden
set nu
" Global settings for all files (but may be overridden in ftplugin).
set tabstop=2
set shiftwidth=2
set expandtab
" colors
set termguicolors "True colors
set background=dark

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

call plug#begin("~/.vim/plugged")
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'hzchirs/vim-material'
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/vim-easy-align'
  "Plug 'SirVer/ultisnips'

  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-fugitive'
  "" Use release branch (recommend)
  ""Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdcommenter'
  Plug 'mileszs/ack.vim' " using ag
  " open fuzzy files
  Plug 'junegunn/fzf.vim'
  Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

colorscheme vim-material
"let g:deoplete#enable_at_startup=1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
end

""*************MAP******************************
autocmd CompleteDone * pclose " To close preview window of deoplete aut
" space to clean search highlighted
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" open file browser
nnoremap ,, :e .<CR>
" return to visual mode after indent in vm
vnoremap > >gv
vnoremap < <gv
" go to buffer
nnoremap gb :ls<CR>:b<Space>
map <leader>/ :execute "Ack " . expand("<cword>")<CR>

" terminal map escape
:tnoremap <Esc> <C-\><C-n>

" open with fuzzy finder
nnoremap ff :FZF<cr>
nnoremap fg :GFiles<cr>
nnoremap fs :GFiles?<cr>
" copy through pbcopy
vmap c :.w !pbcopy<CR><CR> " copy visual selection

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufWritePre * %s/\s\+$//e

