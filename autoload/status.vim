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

function! status#gitbranch(arg)
  return a:arg.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" This function is provided by https://github.com/adscriven
fun! status#age(t) abort
    let u = localtime() - a:t
    let v = u
    " Approx. after weeks, but good enough for me.
    let divisors = [60.0, 60.0, 24.0, 7.0, 4.345238, 12, 1]
    let precisions = [0, 0, 0, 1, 1, 1, 1, 1]
    " secs, mins, hours, days, weeks, months, years
    " s appears twice to make zero seconds work
    let unit = 'ssmhdwMy'
    let n = 0
    while u >= 1 && n < len(divisors)
        let v = u
        let u = u/divisors[n]
        let n += 1
    endwhile
    return printf('%.*f%s', precisions[n], v, unit[n])
endfun

" Cache the result of getftime() at pertinent points in time,
" otherwise you'll hurt performance; and you'll totally destroy
" it for networked files.
augroup vimrc_ftime
au!
au bufread,bufwritepost * let b:ftime = getftime(expand('%:p'))
augroup end

" Requires Age(t) and provided by https://github.com/adscriven
fun! status#fage() abort
    return exists('b:ftime') ? status#age(b:ftime) : ''
endfun
