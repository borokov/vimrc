au BufNewFile,BufRead *note.txt set viewdir=$HOME/vimfiles/view
au BufNewFile,BufRead *note.txt set filetype=notetxt
au BufNewFile,BufRead *note.txt set foldmethod=expr
au BufNewFile,BufRead *note.txt set foldexpr=getline(v:lnum+1)[0]==\"#\"?0:1
au BufNewFile,BufRead *note.txt silent loadview
au BufWrite note.txt mkview
