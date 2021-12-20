" Vim syntax file
" Language:    todo.txt
" Author:      Christoffer Lejdborg <christoffer.lejdborg@gmail.com>
" Filenames:   todo, TODO, todo.txt, TODO.txt

if exists("b:current_syntax")
  finish
endif

syn sync minlines=10
syn case ignore

syn match todoProject       "^#\s\+.\+$" " ligne commencant par # espace

syn match todoTodo          "^-\s.\+"    " ligne commencant par - espace
syn match todoDoing         "^*\s.\+"    " ligne commencant par * espace
syn match todoDone          "^+\s.\+"    " ligne commencant par + espace

hi todoProject               guifg='LightBlue' gui='underline'
hi def link todoTodo         String
hi todoDoing                 guifg='Orange' 
hi def link todoDone         Function

let b:current_syntax = "todotxt"
