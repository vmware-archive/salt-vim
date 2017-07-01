" Slow yaml highlighting workaround
if exists('+regexpengine') && ('&regexpengine' == 0)
  setlocal regexpengine=1
endif

" Use two-spaces for indentation
setlocal expandtab
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal commentstring=#%s

setlocal formatoptions=crl
" r -> don't add comment leader after an Enter
" c -> wrap long comments, including #
" l -> do not wrap long lines

" indentation
setlocal autoindent

" This function is from https://gist.github.com/871107
" Author: Ian Young
"
function! GetYamlIndent()
  let cnum = v:lnum
  let lnum = v:lnum - 1
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let cline = substitute(getline(cnum),'\s\+$','','')
  let indent = indent(lnum)
  let increase = indent + &sw
  let decrease = indent - &sw
  if line =~ ':$'
    return increase
  elseif line !~ ':$' && cline =~ ':$'
    return decrease
  elseif line =~ ':$'
  else
    return indent
  endif
endfunction

setlocal indentexpr=GetYamlIndent()

" folding
setlocal foldmethod=indent
setlocal foldlevel=20  " by default do not fold


" Visual warning about UTF8 characters in SLS file.
" salt does not like them much, so they should be red
augroup utfsls
  autocmd!
  highlight UTFsls ctermbg=red guibg=red
  match UTFsls /[\x7F-\xFF]/
  autocmd BufWinEnter <buffer> match UTFsls /[\x7F-\xFF]/
  autocmd InsertEnter <buffer> match UTFsls /[\x7F-\xFF]/
  autocmd InsertLeave <buffer> match UTFsls /[\x7F-\xFF]/
  autocmd BufWinLeave <buffer> call clearmatches()
augroup END
