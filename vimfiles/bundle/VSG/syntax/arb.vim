" Vim syntax file for iv files
" Language: OpenInventor
" Maintainer: foo
" Last Change: 2009 Nov 17

" check if an earlier file already define syntax
if exists("b:current_syntax")
  finish
endif

syn keyword arbInstructions ABS ADD ARL CMP COS DP3 DP4 DPH DST EX2 EXP FLR FRC KIL LG2 LIT LOG LRP MAD MAX MIN MOV MUL POW RCP RSQ SCS SGE SIN SLT SUB SWZ TEX TXB TXP XPD 

syn keyword arbNVInstructions ABS ADD AND BRK CAL CEIL CMP CONT COS DIV DP2 DP2A DP3 DP4 DPH DST ELSE ENDIF ENDREP EX2 FLR FRC I2F IF KIL LG2 LIT LRP MAD MAX MIN MOD MOV MUL NOT NRM OR PK2H PK2US PK2B PK4UB POW RCC RCP REP RET RFL ROUND RSQ SAD SCS SEQ SFL SGE SGT SHL SHR SIN SLE SLT SNE SSG STR SUB SWZ TEX TRUNC TXB TXD TXF TXL TXP UP2H UP2US UP4B UP4UB X2D XOR XPD

syn keyword arbQualifier ADDRESS ATTRIB PARAM TEMP ALIAS OUTPUT

syn keyword arbVarType SHORT LONG INT UINT FLOAT

syn keyword arbInputVariable vertex fragment primitive result

syn match arbVersion "!!ARB.\+" " n'importe quoi du genre !!ARBblabla
syn keyword arbEND END

" commentaires
syn match arbComment "#.*$" " n'importe quoi du genre # blablabla

syn keyword arbCoords x y z w

"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match           arbNumbers         display transparent "\<\d\|\.\d" contains=arbNumber,arbFloat,arbOctalError,arbOctal
" Same, but without octal error (for comments)
syn match           arbNumbersCom      display contained transparent "\<\d\|\.\d" contains=arbNumber,arbFloat,arbOctal
syn match           arbNumber          display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match           arbNumber          display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match           arbOctal           display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=arbOctalZero
syn match           arbOctalZero       display contained "\<0"
syn match           arbFloat           display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match           arbFloat           display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match           arbFloat           display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match           arbFloat           display contained "\d\+e[-+]\=\d\+[fl]\=\>"
" flag an octal number with wrong digits
syn match           arbOctalError      display contained "0\o*[89]\d*"
syn case match


"-------------------------------------------------------
" set color of each groups

hi def link arbInstructions Keyword
hi def link arbNVInstructions Keyword
hi def link arbQualifier Keyword
hi def link arbVarType Keyword 
hi def link arbComment Comment
hi def link arbVersion PreProc
hi def link arbEND PreProc
hi def link arbInputVariable Identifier
hi def link arbNumbers Number
hi arbCoords gui=bold

" finalize
let b:current_syntax = "arb"
