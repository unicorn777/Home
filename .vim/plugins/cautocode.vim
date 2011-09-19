""
"" cautocode.vim for autocode in /u/a1/sigour_b/.vim/plugins
""
"" Made by SIGOURE Benoit
"" Login   <sigour_b@epita.fr>
""
"" Started on  Mon Feb 20 15:58:40 2006 SIGOURE Benoit
"" Last update Thu Sep  6 15:17:32 2007 Benoit Sigoure
""

" Because coding != rating

if has("autocmd")

  aug coding
    au BufEnter *.[ch],*.C,*.sh,*.sed,*.ti[gh] call CFile_Map()
    au BufLeave *.[ch],*.C,*.sh,*.sed,*.ti[gh] call CFile_UnMap()
    au BufEnter *.cc,*.cpp,*.hh,*.[hc]xx,*.hcc call CXXFile_Map()
    au BufLeave *.cc,*.cpp,*.hh,*.[hc]xx,*.hcc call CXXFile_UnMap()
    au BufEnter *.rb,*.str,*.sdf call RUBYFile_Map()
    au BufLeave *.rb,*.str,*.sdf call RUBYFile_UnMap()
  aug END

  function CFile_Map()
    imap { {<NL> <BS><NL>}<Up><End>
    imap ( ()<Left>
    imap [ []<Left>
  endfun

  function CFile_UnMap()
    silent! iunmap {
    silent! iunmap (
    silent! iunmap [
  endfun

  function CXXFile_Map()
    imap { {<NL> <BS><NL>}<Up><End>
    " uggly but seems necessary to avoid an infinite recursion of the mapping
    imap ( ()<Left><Left><Space><Right>
    imap [ []<Left>
  endfun

  function CXXFile_UnMap()
    iunmap {
    iunmap (
    iunmap [
  endfun

 function RUBYFile_Map()
    imap { {}<Left>
    imap ( ()<Left>
    imap [ []<Left>
  endfun

  function RUBYFile_UnMap()
    iunmap {
    iunmap (
    iunmap [
  endfun

endif
