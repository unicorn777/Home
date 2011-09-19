""
"" cautofile.vim for vim in /u/a1/sigour_b/.vim/plugins
""
"" Made by SIGOURE Benoit
"" Login   <sigour_b@epita.fr>
""
"" Started on  Fri Feb 24 23:26:58 2006 SIGOURE Benoit
"" Last update Wed 27 Oct 2010 03:48:11 PM CEST arolland
""

" original author: unknown
" To make automatikely the files

if exists("$FULLNAME")
  let mename = $FULLNAME
else
  let mename = $USER
endif

if exists("$EMAIL")
  let memail = $EMAIL
else
  " FIXME
  let memail = $USER . "@exalead.com"
endif

if exists("$NO_STRICT_EPITA_HEADERS")
  let meloginstring = "Mail"
else
  let meloginstring = "Login"
endif

if has("autocmd")

  aug coding
    au BufNewFile *.c silent call CFile_New()
    au BufNewFile *.h silent call HFile_New()
    au BufNewFile *.cc silent call CFile_New()
    au BufNewFile *.hh silent call HFile_New()
    au BufNewFile *.hxx silent call HFile_New()
    au BufNewFile *.hcc silent call HFile_New()
    au BufNewFile *.ti[gh] silent call CFile_New()
    au BufNewFile *.sh silent call SHFile_New()
    au BufNewFile configure.* silent call SHARPFile_New()
    au BufNewFile configure silent call SHFile_New()
    au BufNewFile bootstrap silent call SHFile_New()
    au BufNewFile .bash* silent call SHFile_New()
    au BufNewFile .zsh* silent call SHFile_New()
    au BufNewFile *.rb silent call RUBYFile_New()
    au BufNewFile *.sed silent call SEDFile_New()
    au BufNewFile *.vim silent call VIMFile_New()
    au BufNewFile *.aasm silent call AASMFile_New()
    au BufNewFile ?akefile.* silent call SHARPFile_New()
    au BufNewFile ?akefile silent call CMakefile_New()
    au BufNewFile *.m4 silent call SHARPFile_New()

    au BufWritePre *.[ch] silent call CUpdate_Headers()
    au BufWritePre *.cc silent call CUpdate_Headers()
    au BufWritePre *.hh silent call CUpdate_Headers()
    au BufWritePre *.hxx silent call CUpdate_Headers()
    au BufWritePre *.hcc silent call CUpdate_Headers()
    au BufWritePre *.hcc silent call CUpdate_Headers()
    au BufWritePre *.ti[gh] silent call CUpdate_Headers()
    au BufWritePre *.sh silent call SHUpdate_Headers()
    au BufWritePre configure* silent call SHUpdate_Headers()
    au BufWritePre bootstrap silent call SHUpdate_Headers()
    au BufWritePre .bash* silent call SHUpdate_Headers()
    au BufWritePre .zsh* silent call SHUpdate_Headers()
    au BufWritePre *.rb silent call SHUpdate_Headers()
    au BufWritePre *.sed silent call SHUpdate_Headers()
    au BufWritePre *.pl silent call SHUpdate_Headers()
    au BufWritePre *.vim silent call CUpdate_Headers()
    au BufWritePre *.aasm silent call CUpdate_Headers()
    au BufWritePre ?akefile* silent call CUpdate_Headers()
    au BufWritePre *.m4 silent call CUpdate_Headers()
  aug END

  function ReplaceFields(cs, cm, ce)
    execute "% s,@CS@," . a:cs . ",ge"
    execute "% s,@CM@," . a:cm . ",ge"
    execute "% s,@CE@," . a:ce . ",ge"
    execute "% s,@FILE-NAME@," . expand('%:t') . ",ge"
    execute "% s,@LOGIN-STRING@," . g:meloginstring . ",ge"
    execute "% s,@USER-MAIL@," . g:memail . ",ge"
    execute "% s,@USER-NAME@," . g:mename . ",ge"
    execute "% s/@DATE-STAMP@/" . strftime("%c") . "/ge"
    execute "% s,@PWD@," . $PWD . ",ge"
  endfun

  function CFile_New()
    0r ~/.vim/skel/c.tpl
    silent call ReplaceFields('/*', '**', '*/')
    execute "2"
    normal 5w
  endfun

  function RUBYFile_New()
    0r ~/.vim/skel/ruby.tpl
    silent call ReplaceFields('##', '##', '##')
    execute "3"
    normal 5w
  endfun

  function SEDFile_New()
    0r ~/.vim/skel/sed.tpl
    silent call ReplaceFields('##', '##', '##')
    execute "3"
    normal 5w
  endfun

  function SHARPFile_New()
    0r ~/.vim/skel/vim.tpl
    silent call ReplaceFields('##', '##', '##')
    execute "2"
    normal 5w
  endfun

  function VIMFile_New()
    0r ~/.vim/skel/vim.tpl
    silent call ReplaceFields('""', '""', '""')
    execute "2"
    normal 5w
  endfun

  function SHFile_New()
    0r ~/.vim/skel/sh.tpl
    silent call ReplaceFields('##', '##', '##')
    execute "3"
    normal 5w
  endfun

  function HFile_New()
    0r ~/.vim/skel/c.tpl
    normal Gdh
    r ~/.vim/skel/h.tpl
    silent call ReplaceFields('/*', '**', '*/')
    execute "11"
    normal 2wgU$g$bbr_
    execute "12"
    normal 2wgU$g$bbr_
    execute "14"
    normal 4wgU$g$bbbr_
    execute "2"
    normal 5w
  endfun

  function CMakefile_New()
    0r ~/.vim/skel/c.tpl
    silent call ReplaceFields('#', '#', '#')
    normal Gdh
    r ~/.vim/skel/makefile.tpl
  endfun

  function AASMFile_New()
    0r ~/.vim/skel/aasm.tpl
    silent call ReplaceFields(';;', ';;', ';;')
    execute "2"
    normal 5w
  endfun

  function CUpdate_Headers()
    normal mS
    execute "1,8 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:mename . ",e"
    normal `S
  endfun

  function SHUpdate_Headers()
    normal mS
    execute "1,9 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:mename . ",e"
    normal `S
  endfun

endif
