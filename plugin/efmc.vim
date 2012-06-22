function! VerifyModeline(line)
  let res = g:vimolive#parser.match(a:line)
  "if res['is_matched'] != 1
    "echo string(res)
  "endif
  return res['is_matched'] . ' -> ' . string(a:line)
endfunction

function! ValidModelines()
  let lnum = 0
  let fails = []
  for line in getline(1, '$')
    let lnum += 1
    if VerifyModeline(line) =~ '^1'
      call add(fails, lnum . ': ' . substitute(line, '^1 -> ', '', ''))
    endif
  endfor
  return fails
endfunction
