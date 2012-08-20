" Use two-spaces for indentation
set expandtab
set softtabstop=2
set shiftwidth=2
" do not display right side colorcolumn
set colorcolumn=

" do not wrap YAML,  but autowrap long comment lines!
set wrap
set fo-=tor
" t -> don't wrap text 
" o -> don't add comment leader on o/O
" r -> don't add comment leader after an Enter


" folding
set foldmethod=indent
set foldlevel=6  " by default do not fold anything


" Visual warning about UTF8 characters in SLS file.
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


