" Vim plugin for todo.txt
" Author: Christoffer Lejdborg <christoffer.lejdborg@gmail.com>

function! OivcfgOpen()
  "exe "tabnew " $OIV_CONFIG_FILE
  exe "e " $OIV_CONFIG_FILE
endfunction

com! Oivcfg :call OivcfgOpen()
