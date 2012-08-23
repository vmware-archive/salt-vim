" Use two-spaces for indentation
setlocal expandtab
setlocal softtabstop=2
setlocal shiftwidth=2
" do not display right side colorcolumn
setlocal colorcolumn=

" do not wrap YAML,  but autowrap long comment lines!
setlocal wrap
setlocal fo-=tor
" t -> don't wrap text 
" o -> don't add comment leader on o/O
" r -> don't add comment leader after an Enter


" indentation
setlocal autoindent

" This function is from https://gist.github.com/871107
" Author: Ian Young
"
function! GetYamlIndent()
  let lnum = v:lnum - 1
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let indent = indent(lnum)
  let increase = indent + &sw
  if line =~ ':$'
    return increase
  else
    return indent
  endif
endfunction

setlocal indentexpr=GetYamlIndent()

" folding
setlocal foldmethod=indent
setlocal foldlevel=6  " by default do not fold anything


" Visual warning about UTF8 characters in SLS file.
" salt does not like them much, so they should be red
augroup utfsls
  autocmd!
  highlight UTFsls ctermbg=red guibg=red
  match UTFsls /[\x7F-\xFF]/
  autocmd BufWinEnter * match UTFsls /[\x7F-\xFF]/
  autocmd InsertEnter * match UTFsls /[\x7F-\xFF]/
  autocmd InsertLeave * match UTFsls /[\x7F-\xFF]/
  autocmd BufWinLeave * call clearmatches()
augroup END


