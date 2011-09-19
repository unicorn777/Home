au BufRead,BufNewFile * 
        \       if getline(2) =~ '.*-\*- [Pp]erl -\*-.*' |
        \         set filetype=perl |
        \       endif
