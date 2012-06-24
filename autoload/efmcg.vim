" Parser compiled on Sun 24 Jun 2012 05:00:34 PM CST,
" with VimPEG v0.2 and VimPEG Compiler v0.1
" from "efmcg.vimpeg"
" with the following grammar:

" ; vim-efmc - Vim Errorformat Compiler
" ; Barry Arthur & Israel Chauca, 2012 06 22
" 
" .skip_white = false
" .namespace = 'efmc'
" .parser_name = 'efmc#parser'
" .root_element = 'efm'
" .ignore_case = false
" 
" efm        ::= efmline+ eof
" efmline    ::= efmset | comment
" efmset     ::= (whitespace* ( skip | keyword | string | regex))+ eol
" regex      ::= '/' ( '\\\\' | '\\/' | !'/' '.' )* '/' -> #regex
" string     ::= "'" ( "''" | !"'" '.' )* "'" -> #string
" skip       ::= 'skip' whitespace* regex -> #skip
" keyword    ::= '\a\+' -> #keyword
" comment    ::= whitespace* '#.*' -> #comment
" whitespace ::= ( '\s' | eol )
" eol        ::= '\n'
" eof        ::= '\_$'
" 
" ; [ [[], '{'], [[...], ' '], [[...], '}'] ]
" 

let s:p = vimpeg#parser({'root_element': 'efm', 'skip_white': 0, 'ignore_case': 0, 'parser_name': 'efmc#parser', 'namespace': 'efmc'})
call s:p.and([s:p.many('efmline'), 'eof'],
      \{'id': 'efm'})
call s:p.or(['efmset', 'comment'],
      \{'id': 'efmline'})
call s:p.and([s:p.many(s:p.and([s:p.maybe_many('whitespace'), s:p.or(['skip', 'keyword', 'string', 'regex'])])), 'eol'],
      \{'id': 'efmset'})
call s:p.and([s:p.e('/'), s:p.maybe_many(s:p.or([s:p.e('\\\\'), s:p.e('\\/'), s:p.and([s:p.not_has(s:p.e('/')), s:p.e('.')])])), s:p.e('/')],
      \{'id': 'regex', 'on_match': 'efmc#regex'})
call s:p.and([s:p.e("'"), s:p.maybe_many(s:p.or([s:p.e("''"), s:p.and([s:p.not_has(s:p.e("'")), s:p.e('.')])])), s:p.e("'")],
      \{'id': 'string', 'on_match': 'efmc#string'})
call s:p.and([s:p.e('skip'), s:p.maybe_many('whitespace'), 'regex'],
      \{'id': 'skip', 'on_match': 'efmc#skip'})
call s:p.e('\a\+',
      \{'id': 'keyword', 'on_match': 'efmc#keyword'})
call s:p.and([s:p.maybe_many('whitespace'), s:p.e('#.*')],
      \{'id': 'comment', 'on_match': 'efmc#comment'})
call s:p.or([s:p.e('\s'), 'eol'],
      \{'id': 'whitespace'})
call s:p.e('\n',
      \{'id': 'eol'})
call s:p.e('\_$',
      \{'id': 'eof'})

let g:efmc#parser = s:p.GetSym('efm')
