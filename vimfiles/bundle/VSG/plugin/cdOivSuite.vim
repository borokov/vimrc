" Vim plugin for todo.txt

function! CdPatchFunction(version)
  exe "cd $OIVHOME_".a:version."/.."
endfunction

com! CdPatch :call CdPatchFunction("PATCH")
com! CdMinor :call CdPatchFunction("MINOR")
com! CdMajor :call CdPatchFunction("MAJOR")
com! CdNre :call CdPatchFunction("DEV")

