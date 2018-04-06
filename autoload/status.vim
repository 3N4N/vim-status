function! status#readOnly(arg) abort
  if (&readonly || !&modifiable)
    return '  '.a:arg
  else
    return ''
  endif
endfunction

function! status#modified(arg) abort
  if &modified
    return a:arg
  else
    return ''
  endif
endfunction

function! status#gitInfo(arg) abort
  let git = gitbranch#name()
  if git != ''
    return '  '. a:arg.' '.gitbranch#name()
  else
    return ''
  endif
endfunction

function! status#filename() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  return filename
endfunction

function! status#filetype() abort
  return &filetype
endfunction

