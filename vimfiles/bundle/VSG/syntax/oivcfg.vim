" Vim syntax file
" Language:    todo.txt
" Author:      Christoffer Lejdborg <christoffer.lejdborg@gmail.com>
" Filenames:   todo, TODO, todo.txt, TODO.txt

if exists("b:current_syntax")
  finish
endif

syn sync minlines=10
syn case ignore

syn match oivSection         "^#\s\+.\+$"

syn match oivEnable          "^\u\+.*"
syn match oivDisable         "^#\u\+.*"

hi oivSection       guifg='LightGreen' gui='underline'
hi oivEnable        guifg='LightGray'
hi oivDisable       guifg='DarkGray'

let b:current_syntax = "oivcfg"
