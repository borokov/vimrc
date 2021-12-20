" Vim plugin for todo.txt
" Author: Christoffer Lejdborg <christoffer.lejdborg@gmail.com>

function! NoteOpen()
  let note_file = "e:/note.txt"
  " Open todo file in new tab
  exe "e ".note_file
endfunction


function! NewNote(noteName)
  let note_file = "d:/Notes/".a:noteName."_note.txt"
  exe "e ".note_file
endfunction

com! Note :call NoteOpen()
com! -nargs=1 NewNote :call NewNote(<f-args>)
