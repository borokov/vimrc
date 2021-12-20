" Language: OpenInventor scenegraph language

autocmd BufNewFile,BufRead *.iv set filetype=iv

" Path is hard coded because I'm too lazy to make it generic. 
" If you know how to do it properly, feel free to fix it.
au BufRead,BufNewFile *.iv set dictionary=$HOME/vimfiles/bundle/vim-inventor/dict/iv
