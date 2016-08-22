command! -nargs=0 SynInfo call <SID>ShowSyntax()

function! <SID>ShowSyntax()
  let l:current  = synID(line('.'), col('.'), 0)
  let l:resolved = synIDtrans(l:current)

  let l:visible = synID(line('.'), col('.'), 1)
  let l:final   = synIDtrans(l:visible)

  echon synIDattr(l:current, 'name')
  if l:current != l:resolved
    echon ' -> ' . synIDattr(l:resolved, 'name')
  endif

  if l:visible != l:current
    echon ' ('
    echon synIDattr(l:visible, 'name')
    if l:final != l:visible
      echon ' -> ' . synIDattr(l:resolved, 'name')
    endif
    echon ')'
  endif
  exe 'syn list ' . synIDattr(l:current, "name")
endfunction


