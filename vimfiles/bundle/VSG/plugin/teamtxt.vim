" Vim plugin for todo.txt
" Author: Christoffer Lejdborg <christoffer.lejdborg@gmail.com>

function! TeamOpen()
  " Find the active todo file
  if filereadable("d:/backuped/team.txt")
    let todo_file = "d:/backuped/team.txt"
  else
    let todo_file = "d:/backuped/team.txt"
  endif

  " Open todo file in new tab
  exe "tabnew ".todo_file
endfunction

com! Team :call TeamOpen()
