" vimrc pour windows

" plugin pathogen. Must be done in first.
execute pathogen#infect()

"------------------------------------------------------------------------------
" common
" colorscheme desert			" style de coloration
colorscheme solarized			" style de coloration

set tabstop=2						" tab = 2 spaces
set shiftwidth=2				" tab = 2 spaces
set expandtab						" utilise tjrs des espace lors d'un tab
set nocompatible        " Utilise les defauts Vim (bien mieux !)
set backspace=2         " autorise l'effacement de tout en mode insertion
set autoindent          " toujours utiliser l'autoindentation
set hlsearch						" coloration de la derniere chaine recherchee
set ignorecase					" ignore la case pendant la recherche
set smartcase						" ignore la case pendant la recherche
set guioptions-=T				" remove toolbar in gvim
set guioptions-=m				" remove menubar in gvim
set scrolloff=3					" 3 ligne avant/apres le cursor quand on scroll
syntax on								" coloration syntaxique
set lines=50						" taille fenetre: 50 ligne
set columns=130					" 130 colonnes
set nowrap							" pas de wrap line (retour ligne si la ligne est trop longue)
set sidescroll=1        " defilement horizontal fluide en nowrap
set foldmethod=manual		" replier le texte (folding) manuelement (zf)
set diffopt=vertical		" separation vertical quand on fait un diff
filetype on             " pour que vim detect le type de fichier courant
set foldlevelstart=99   " ouvre tout les fold par defaut
set dir=$TMP            " utilise le dossier temp de windows
set virtualedit+=block  " ameliore la selection en mode block (ctrl+v)
set browsedir=buffer    " Vim current working directory is always the same as the file in the open buffer.
set autochdir           " Automatically go in the right dir when open file.
set whichwrap=b,s,<,>,[,] " continue au debut de la igne suivante quand on arrive en fin de ligne
set undofile            " alow persistent undo (save undo when file is closed)
set undodir=$TMP        " direcory where is saved undofiles
set visualbell          " don't beep on error
set noshowmode          " desactive l'affichage du mode (INSERT, VISUAL, ...). J'utilise vim-airline a la place.
set hidden              " Pour pouvoir ouvrir un fichier dans un nouveau buffer sans fermer et devoir enregistrer le buffer existant

set nu                  " affiche le num de la ligne
" change la font des numeros de ligne a gauche
hi LineNr font=Consolas:h10:cANSI:

set cursorline          " affiche la ligne ou se trouve le curseur

" Pour retrouver la bonne font qui va bien
" set guifont=Courier_New:h10:b:cANSI:
" ou si on utilise le plugin vim-airline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
" needed by vim-airline
set encoding=utf-8

" pour avoir une statuline sympa
set laststatus=2			" affiche la statusline comme 2eme line
"desactive. Utilise airline a la place
"set statusline=%F%=[%l/%L]\ %p%%	    " donne: chemin/du/fichier                 [24/856] 10%

" label pour les onglet. Nom du fichier et + si modif
set guitablabel=%t%m

" Use the cool tab complete command menu
set wildmenu
set wildmode=list:longest,full

" wrap pour les txt
au BufRead, BufNewFile *.txt set wrap
au BufRead, BufNewFile *.txt set linebreak

"------------------------------------------------------------------------------
" la ca se complique, on redefinit certain raccourci de vim.

" utilise , au lieu de \ comme caractere special (pour definir des custom command)
let mapleader = ","

" utilise ,ev pour editer le vimrc (comme Edit Vimrc) et ,sv comme Source Vimrc.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" ,tw pour virer les trailing whitespace en fin de ligne
" With the following mapping a user can delete all trailing whitespace.
" The variable _s is used to save and restore the last search pattern register
" (so next time the user presses n they will continue their last search), and
" :nohl is used to switch off search highlighting (so trailing spaces will not be
" highlighted while the user types). The e flag is used in the substitute command
" so no error is shown if trailing whitespace is not found. Unlike before,
" the substitution text must be specified in order to use the required flag.
:nnoremap <silent> <leader>tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" utilise (( et )) pour naviger d'une fonction a l'autre
nnoremap (( [[
nnoremap )) ]]

" alt-up/down pour monter/descendre la ligne courant
nnoremap <A-Up>   :m-2<CR>
nnoremap <A-Down> :m+<CR>
" alt-up/down pour monter/descendre le block selectionne
vnoremap <A-Up>   :m-2<CR>gv=gv
vnoremap <A-Down> :m'>+<CR>gv=gv

" navigue par display line en mode wrap quand une ligne est sur plusieurs lignes
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" utilise le presse papier windows par défaut pour copier/coller.
nnoremap p "+p
nnoremap y "+y
nnoremap dd "+dd
nnoremap yy "+yy
nnoremap Y "+yy
vnoremap p "+p
vnoremap y "+y
vnoremap d "+d
vnoremap x "+x

" selectionne un mot en visual. tape x. selection un autre mot en visual. ctrl+x swap les 2 mots
vnoremap <C-X> <Esc>`.``gvP``P

" ouvre le fichier situe sous le curseur dans un nouvel onglet
nnoremap gf <c-w>gf

" ctrl+tab to cycle through buffers
nnoremap <C-tab> :bnext<CR>
nnoremap <C-right> :bnext<CR>
nnoremap <C-left> :bprev<CR>
nnoremap <C-down> :bdelete<CR>


"------------------------------------------------------------------------------
" necessite plugin, syntax, etc...
"------------------------------------------------------------------------------

" associe les *.toto a la syntax toto. Le fichier de syntax doit se trouver dans vimfile/syntax
au BufRead,BufNewFile *asm* set filetype=asm
au BufRead,BufNewFile *.fp set filetype=arb

au BufRead,BufNewFile *.txt set wrap
au BufRead,BufNewFile *.txt set linebreak

" lance NERDTree (explorateur fichier) avec F9
nnoremap <silent> <F9> :NERDTreeToggle<CR>

" plugin bookmarking
map <silent> bb :ToggleBookmark<CR>
map <silent> bn :NextBookmark<CR>
map <silent> bp :PreviousBookmark<CR>
let g:bookmarking_menu = 1

" plugin MRU
let MRU_Max_Entries = 10

" plugin indent guide
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

" airline (:h aireline)
let g:airline_powerline_fonts = 1      " utilise les font patche pour avoir les symbole > et <
" let g:airline_theme='bubblegum'        " theme
let g:airline_theme='solarized'        " theme
let g:airline_section_x=''             " rien. Normalement c'est le fileType
let g:airline_section_y=''             " rien. Normalement c'est l'encodage
let g:airline_section_z='%p%% [%l/%L]' " affiche line/totalLine a droite de la barre
" affiche I, N, V au lieu de INSERT, VISUAL, ...
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" change tab separator to | instead of arrow
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"----------------------------------------------------------------
" config de ctags

" ajoute les mots du dictionnaire quand on autocomplete avec ctrl-N (see help 'complete')
set complete+=k
set complete-=w
set complete-=b
set complete-=u
set complete-=t
set complete-=i

" change le comportement de la list d'autocompletion. Je sais pas trop ce que ça fait mais c'est mieux
set completeopt=longest,menu,preview ",menuone

" Color of popup menu
:hi Pmenu guibg=#404040 guifg=Grey font=Consolas:h10

" utilise la completion C classique pour le glsl
au BufNewFile,BufRead,BufEnter *.glsl set omnifunc=ccomplete#Complete

" do not run ctags when display SrcExpl. ctags suck with our shaders...
let g:SrcExpl_isUpdateTags = 0
" open SrcExpl with F8
nmap <F8> :SrcExplToggle<CR>

" find non ascii caracters
" /[\x7f-\xff]
" remove ^M
" :%s/ctrl-V ctrl-M//g
