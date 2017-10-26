autocmd FileType task noremap <silent> <buffer> <F2> :call Toggle_task_status()<CR>
autocmd FileType task inoremap <silent> <buffer> <F2> <ESC>:call Toggle_task_status()<CR>
