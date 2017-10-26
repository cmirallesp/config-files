autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks  setfiletype task
autocmd BufNewFile,BufRead *.es6 setfiletype javascript
"Pandoc syntax
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md,*.scholmd setfiletype markdown.pandoc
augroup END
