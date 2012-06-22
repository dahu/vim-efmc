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
      \ 'scanf'   : '%*',
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
