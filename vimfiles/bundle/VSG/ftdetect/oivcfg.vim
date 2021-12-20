au BufNewFile,BufRead oiv.cfg set viewdir=$HOME/vimfiles/view
au BufNewFile,BufRead oiv.cfg set filetype=oivcfg
"au BufNewFile,BufRead oiv.cfg set foldmethod=expr
"au BufNewFile,BufRead oiv.cfg set foldexpr=getline(v:lnum)[0]=!\"#\"?0:1
au BufNewFile,BufRead oiv.cfg silent loadview
au BufWrite oiv.cfg mkview
