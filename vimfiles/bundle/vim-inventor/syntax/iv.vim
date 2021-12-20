" Vim syntax file for iv files
" Language: OpenInventor
" Maintainer: foo
" Last Change: 2009 Nov 17

" check if an earlier file already define syntax
if exists("b:current_syntax")
  finish
endif

" keyword
setlocal iskeyword+=# " so we can put a # in #Inventor keyword
syn keyword ivKeyword DEF USE ascii #Inventor

" Keywords group
syn keyword ivGroup Separator Selection Group Switch VolumeClippingGroup VolumeMaskGroup MultiDataSeparator VolumeGroup LevelOfDetail TransformSeparator ShadowGroup

" keyword shapes
syn keyword ivShape Image Sphere CSGShape Cube Cylinder Cone VolumeRender OrthoSlice SoFenceSlice FenceSlice ObliqueSlice VolumeSkin HeightFieldRender File GradientBackground CircularExtrusion LineSet PointSet IndexedFaceSet IndexedTriangleStripSet IndexedPointSet MarkerSet IndexedMarkerSet Text2 Text3 AnnoText

" keyword properties
syn keyword ivProperty ResetTransform Translation Transform Scale Rotation Rotation DrawStyle LightModel BaseColor ShapeHints LDMShapeHints VolumeDataDrawStyle VolumeMask VolumeRenderingQuality VolumeShader TransferFunction VolumeData HeightFieldGeometry HeightFieldProperty HeightFieldPropertyMask Material InteractiveComplexity NormalBinding PickStyle TransparencyType DepthBuffer Complexity PackedColor MaterialBinding MatrixTransform TextureUnit UniformGridClipping DataRange UniformGridProjectionClipping Coordinate3 VertexProperty Texture2 Texture3 VolumeIsosurface VolumeRenderingPhysicalQuality

" keyword camera (and other stuff)
syn keyword ivCamera PerspectiveCamera OrthographicCamera DirectionalLight

" comments
syn match ivComment "#.*$" " anything like # blablabla

" string
syn match ivString "\".*\""

" enum values
syn match ivEnum "\<\u\+_*\u*_*\u*\>" " upper case words with _: MAJ_MAJ_MAJ

" filed list [ ... ]
syn match ivFieldList "\[\_.\{-}\]" " anything like [ ..... maybe multi line ...]

"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match           ivNumbers         display transparent "\<\d\|\.\d" contains=ivNumber,ivFloat,ivOctalError,ivOctal
" Same, but without octal error (for comments)
syn match           ivNumbersCom      display contained transparent "\<\d\|\.\d" contains=ivNumber,ivFloat,ivOctal
syn match           ivNumber          display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match           ivNumber          display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match           ivOctal           display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=ivOctalZero
syn match           ivOctalZero       display contained "\<0"
syn match           ivFloat           display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match           ivFloat           display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match           ivFloat           display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match           ivFloat           display contained "\d\+e[-+]\=\d\+[fl]\=\>"
" flag an octal number with wrong digits
syn match           ivOctalError      display contained "0\o*[89]\d*"
syn case match



"-------------------------------------------------------
" set color of each groups

hi ivKeyword guifg='Magenta'
hi ivGroup guifg='Cyan'
hi ivShape guifg='Red'
hi ivProperty guifg='Green'
hi ivCamera guifg='DarkYellow'
hi ivFieldList guifg='grey40'
hi def link ivComment Comment
hi def link ivString String
hi def link ivEnum Define
hi def link ivNumbers Number

" finalize
let b:current_syntax = "iv"
