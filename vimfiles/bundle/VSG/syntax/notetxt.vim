" Vim syntax file
" Language:    todo.txt
" Author:      Christoffer Lejdborg <christoffer.lejdborg@gmail.com>
" Filenames:   todo, TODO, todo.txt, TODO.txt

if exists("b:current_syntax")
  finish
endif

syn sync minlines=10
syn case ignore

syn match noteProject       "^#\s\+.\+$"

hi noteProject               guifg='LightBlue' gui='underline'

let b:current_syntax = "notetxt"
