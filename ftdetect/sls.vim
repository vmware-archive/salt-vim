function! DetectSls()
  if !did_filetype()
    if match(getline(1), '^#!py') > -1
      set ft=python
    else
      set ft=sls
    endif
  endif
endfunction

:au BufNewFile,BufRead *.sls call DetectSls()
