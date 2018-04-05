function! status#readOnly() abort
  if (&readonly || !&modifiable)
    return ' '
  else
    return ''
  endif
endfunction

function! status#modified() abort
  if &modified
    return '[+]'
  else
    return ''
  endif
endfunction

function! status#gitInfo() abort
  let git = gitbranch#name()
  if git != ''
    "return '  '.gitbranch#name()
    return '  '.gitbranch#name()
  else
    return ''
  endif
endfunction

function! status#filename() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let readonly = status#readOnly()
  let gitinfo = status#gitInfo()
  return filename . readonly . gitinfo
endfunction

function! status#filetype() abort
  return &filetype
endfunction

