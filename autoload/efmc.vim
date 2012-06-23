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
  return efmc#efm_escape(join(map(a:elems[1], 'v:val[1]'), ''))
endfunc

func! efmc#skip(elems)
  "echom "keyword: " . string(a:elems)
  return s:keywords['skip'] . a:elems[2]
endfunc

" stub this for now
func! efmc#efm_escape(string)
  return escape(a:string, '\')
endfunc
