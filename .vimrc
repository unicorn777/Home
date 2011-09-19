syntax on
set cindent
set autoindent
set tabstop=2
set sw=2
"set smarttab
set expandtab
set backspace=indent,eol,start
set showmatch
set hlsearch

" Affiche le nombre de lignes séléctionnées
  set sc

" Ignorer la casse par defaut dans les recherches
  set ignorecase
  set smartcase

" Retour a la ligne precedante
  set whichwrap=b,s,<,>,[,]

" Options spécifique à la syntaxe html :
  " Coloriser le html dans les chaines php
    let php_htmlInStrings=1
  " Coloriser le SQL dans les chaines php
    let php_sql_query=1

" Display and color the status line everytime
  set laststatus=2
  set statusline=[%n]\ %<%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\Line\ [%4l/%4L]\ \Col\ [%02c%03V]%)\ ascii['%03b']\ %P
  set wildmenu
  colorscheme torte
  highlight StatusLine term=reverse  cterm=bold ctermfg=white ctermbg=darkblue gui=bold guifg=white guibg=blue

" Prologin
  " Drupal
    " Treat .module files as .php files
    au BufRead,BufNewFile *.module set filetype=php

" Plugin
  " Header
    source ~/.vim/plugins/cautofile.vim

nmap <C-Left> <C-W>h
nmap <C-Right> <C-W>l
nmap <C-Up> <C-W>k
nmap <C-Down> <C-W>j

nmap <M-Left> <C-W><
nmap <M-Right> <C-W>>
nmap <M-Up> <C-W>+
nmap <M-Down> <C-W>-

" Special key mapping so ctrl+shortcut works within a screen session
nmap <ESC>[6;5~ <C-PageDown>
nmap <ESC>[5;5~ <C-PageUp>
nmap <ESC>[1;5A <C-Up>
nmap <ESC>[1;5B <C-Down>
nmap <ESC>[1;5D <C-Left>
nmap <ESC>[1;5C <C-Right>

nmap <ESC>[1;3A <M-Up>
nmap <ESC>[1;3B <M-Down>
nmap <ESC>[1;3D <M-Left>
nmap <ESC>[1;3C <M-Right>

    
" Gestion de la souris
  if has("mouse")
"    set mouse=ar
"    set mousemodel=extend
"    set mousefocus
    set mousehide
  endif

  " Treat Exascript (*.exa) as Java file (*.java)
  augroup filetype
    au BufRead,BufNewFile *.java	set tabstop=4
    au BufRead,BufNewFile *.java	set sw=4
    au BufRead,BufNewFile *.exa		set filetype=java
    au BufRead,BufNewFile *.exa   syntax keyword Structure contains
    au BufRead,BufNewFile *.exa   syntax keyword Keyword using
  augroup END
