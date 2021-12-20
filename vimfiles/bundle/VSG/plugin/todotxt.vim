" Vim plugin for todo.txt
" Author: Christoffer Lejdborg <christoffer.lejdborg@gmail.com>

function! TodoOpen()
  " Find the active todo file
  if filereadable("E:/OneDrive - Thermo Fisher Scientific/backuped/todo.txt")
    let todo_file = "E:/OneDrive - Thermo Fisher Scientific/backuped/todo.txt"
  else
    let todo_file = "E:/OneDrive - Thermo Fisher Scientific/backuped/todo.txt"
  endif

  " Open todo file in new tab
  exe "e ".todo_file
endfunction

com! Todo :call TodoOpen()
