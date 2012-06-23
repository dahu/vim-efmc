runtime autoload/efmcg.vim

let s:keywords = {
      \ 'file'    : '%f',
      \ 'line'    : '%l',
      \ 'col'     : '%c',
      \ 'virtcol' : '%v',
      \ 'type'    : '%t',
      \ 'number'  : '%n',
      \ 'message' : '%m',
      \ 'rest'    : '%r',
      \ 'pointer' : '%p',
      \ 'skip'    : '%*',
      \ 'string'  : '%s',
      \}

let s:regexes = {
      \ '\\' : '%\\',
      \ '\.'  : '%.',
      \ '\*'  : '%#',
      \ '\^'  : '%^',
      \ '\$'  : '%$',
      \ '\['  : '%[',
      \ '\~'  : '%~'
      \}

func! efmc#keyword(elems)
  "echom "keyword: " . string(a:elems)
  let kw = a:elems
  if has_key(s:keywords, kw) != 0
    return s:keywords[kw]
  else
    echom 'Error: unknon keyword: ' . kw
    return ''
  endif
endfunc

func! efmc#regex(elems)
  echom "regex: " . string(a:elems)
  return efmc#efm_escape(efmc#efm_regex(join(map(a:elems[1], 'v:val[1]'), '')))
endfunc

func! efmc#skip(elems)
  "echom "keyword: " . string(a:elems)
  " Unsure if I need to reduce all %[ to [
  let regex = substitute(a:elems[2], '^%[', '[', 'g')
  return s:keywords['skip'] . regex
endfunc

" stub this for now
func! efmc#efm_escape(string)
  return escape(a:string, '\')
endfunc

func! efmc#efm_regex(string)
  let str = a:string
  for regex in items(s:regexes)
    let str = substitute(str, regex[0], regex[1], 'g')
  endfor
  return str
endfunc
