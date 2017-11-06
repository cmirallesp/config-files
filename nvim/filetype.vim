autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks,*.todo  setfiletype task
autocmd BufNewFile,BufRead *.es6 setfiletype javascript
"Pandoc syntax
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md,*.scholmd setfiletype markdown.pandoc
augroup END
augroup task
	au! FileType task inoremap <silent> <buffer> <F2> <ESC>:call Toggle_task_status()<CR>i
	au! FileType task noremap <silent> <buffer> <F2> :call Toggle_task_status()<CR>
augroup END
