au BufNewFile,BufRead todo.txt,team.txt set viewdir=$HOME/vimfiles/view
au BufNewFile,BufRead todo.txt,team.txt set filetype=todotxt
au BufNewFile,BufRead todo.txt,team.txt set foldmethod=expr
au BufNewFile,BufRead todo.txt,team.txt set foldexpr=getline(v:lnum+1)[0]==\"#\"?0:1
au BufNewFile,BufRead todo.txt,team.txt silent loadview
au BufWrite todo.txt,team.txt mkview
