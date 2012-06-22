function! CompileErrorFormat(efmcg) abort
  let res = g:efmc#parser.match(a:efmcg)
  if res['is_matched'] != 1
    echoerr "Invalid ErrorFormat Source: " . res['error']
  endif
  return res['value']
endfunction
