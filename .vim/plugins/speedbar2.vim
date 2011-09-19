" A plugin in order to have a speedbar, like in emacs
" Remember, emacs c'est MAL !

"--------------------------.
"  Configuration functions |
"--------------------------/

" The tags location and options
let g:tag_file="/tmp/${USER}_vim_tags"
let g:tag_filename="${USER}_vim_tags"
let g:tag_rep="/tmp"
let g:tag_options="-T -w"
execute "set tags+=" . g:tag_file

" Initial modifications on buffer
function Speedbar_Init()
  execute "silent" . Speedbar_Size() . "vsplit ."
  call Speedbar_Syntax()
  call Speedbar_Map()
  call Speedbar_Show()
  call TagCreate()
endfun

" Maps for mouse, etc...
function Speedbar_Map()
  nnoremap <buffer> <CR>                :call Speedbar_LeftClick()<CR>
  nnoremap <buffer> <2-LeftMouse>       :call Speedbar_LeftClick()<CR>
  nnoremap <buffer> <BS>                :call Speedbar_RightClick()<CR>
  nnoremap <buffer> <RightMouse>      :call Speedbar_RightClick()<CR>
  unmap <buffer> o
  unmap <buffer> ?
  unmap <buffer> a
  unmap <buffer> i
endfun

" Colorize correctly files
function Speedbar_Syntax()
  highlight SB_cFile ctermbg=Black guibg=Black ctermfg=Green guifg=Green
  highlight SB_hFile ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey
  highlight SB_mFile ctermbg=Black guibg=Black ctermfg=Blue guifg=Blue
  syn match SB_cFile "^.*\.\(c\|cc\|cpp\|cxx\)$"
  syn match SB_hFile "^.*\.\(h\|hh\|hxx\)$"
  syn match SB_mFile "^[Mm]akefile$"
endfun

" Modify the list initially given by the browser plugin
function Speedbar_Show()
  set modifiable
  normal 1G3dd
  execute "silent %!grep \'^.*\\(\\.hxx\\|\\.cxx\\|\\.hh\\|\\.c\\|\\.h\\|\\.cc\\|/\\|akefile\\)$\'"
  set nomodifiable
endfun

" Build Tags
function TagCreate()
  let current_dir = getcwd()
  execute "silent !sh -c 'cd " . g:tag_rep . " && ctags " . g:tag_options . " -f " . g:tag_filename .  " " . current_dir . "/* 2> /dev/null'"
endfun

"-------------------.
"  Action functions |
"-------------------/

" Function called by Left Click on mouse
function Speedbar_LeftClick()
  if IsFunction(".")
    call Speedbar_GotoFun()
  else
    call Speedbar_Open()
  endif
endfun

" Function called by Left Click on mouse
function Speedbar_RightClick()
  if IsCodeFile(".")
    if IsFunction(line(".") + 1)
      call Speedbar_Desexpand()
    else
      call Speedbar_Expand()
    endif
  endif
endfun

" Open a file or a directory
function Speedbar_Open()
  if IsDirectory(".")
    execute "cd " . expand("<cword>")
    execute "e ."
    call Speedbar_Syntax()
    call Speedbar_Map()
    call Speedbar_Show()
    call TagCreate()
  else
    normal O
  endif
endfun

" Open a file and goto function
" FIXME
function Speedbar_GotoFun()
  let funk = expand("<cword>")
  normal O
  execute "tag " . funk
endfun

" Expand the list of functions
" FIXME
function Speedbar_Expand()
  if IsCodeFile(".")
    set modifiable
    normal o
    normal k
    execute "silent .+1!grep '" . escape(expand("<cfile>"),".") . "' " . g:tag_file
    execute "silent %s/^\\([^[:blank:]]*\\)\t.*$/\\/\\> \\1/"
    set nomodifiable
  endif
endfun

" Hide the list of functions
function Speedbar_Desexpand()
  set modifiable
  normal j
  while IsFunction(".")
    normal dd
  endwhile
  normal k
  set nomodifiable
endfun

"-----------------.
"  Misc functions |
"-----------------/

" It is a code file ?
function IsCodeFile(line)
  let current_line = getline(a:line)
  if IsFunction(a:line) || IsDirectory(a:line)
    return 0
  else
    return 1
endfun

" It is a function ?
function IsFunction(line)
  let current_line = getline(a:line)
  return current_line =~ "^\/\>.*$"
endfun

" It is a directory ?
function IsDirectory(line)
  let current_line = getline(a:line)
  return current_line =~ "^.*/$"
endfun

" To decide SpeedBar size
function Speedbar_Size()
  return &columns / 4
endfun

"-----------------------------------------------------------------------------"
"                             Main function :)                                "
"-----------------------------------------------------------------------------"

function SpeedBar()
  " Initialisation
  call Speedbar_Init()
endfun
