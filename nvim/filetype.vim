autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks,*.todo  setfiletype task
autocmd BufNewFile,BufRead *.es6 setfiletype javascript
"Pandoc syntax
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.scholmd setfiletype markdown.pandoc
	noremap <leader>p :!scholdoc % -t latex -o %:r.pdf <CR>
	noremap <leader>o :!open %:r.pdf <CR>
augroup END

augroup task
	au! FileType task inoremap <silent> <buffer> <F2> <ESC>:call Toggle_task_status()<CR>i
	au! FileType task noremap <silent> <buffer> <F2> :call Toggle_task_status()<CR>
augroup END
"python yapf formater
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
" remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
" run Neoformat on save
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

" markdown table format
au FileType markdown vmap <leader><Bslash> :EasyAlign*<Bar><Enter>
au FileType markdown.pandoc vmap <leader><Bslash> :EasyAlign*<Bar><Enter>

augroup go
	autocmd!
	autocmd FileType go nmap <leader>b :GoBuild<enter>
	autocmd FileType go nmap <leader>r :GoRun<enter>
	autocmd FileType go nmap <leader>t :GoTest<enter>
	let g:go_term_mode = "split"
augroup END
