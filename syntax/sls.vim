" Vim syntax file
" Language: Salt States template
" Maintainer: Seth House <seth@eseth.com>
" Last Change: 2012 June 20
"
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'yaml'
endif

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/yaml.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim

let b:current_syntax = ''
unlet b:current_syntax

" Default to look for Jinja syntax file
let s:load_jinja_syntax = 0
let s:search_for_jinja_syntax = 1
if exists("g:sls_use_jinja_syntax")
  let s:search_for_jinja_syntax = 0
  let s:load_jinja_syntax = g:sls_use_jinja_syntax
endif
if s:search_for_jinja_syntax
  let s:jinja_path = findfile("syntax/jinja.vim", &rtp, 1)
  if s:jinja_path != ""
    let s:load_jinja_syntax = 1
  endif
endif

if s:load_jinja_syntax
  syntax include @Jinja syntax/jinja.vim

  syn cluster jinjaSLSBlocks add=jinjaTagBlock,jinjaVarBlock,jinjaComment
  " Mostly copy/pasted from
  " https://github.com/mitsuhiko/jinja2/blob/6b7c0c23/ext/Vim/jinja.vim
  syn region jinjaTagBlock matchgroup=jinjaTagDelim start=/{%-\?/ end=/-\?%}/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment,@jinjaSLSBlocks
  syn region jinjaVarBlock matchgroup=jinjaVarDelim start=/{{-\?/ end=/-\?}}/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment,@jinjaSLSBlocks
  syn region jinjaComment matchgroup=jinjaCommentDelim start="{#" end="#}" containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString,@jinjaSLSBlocks
else
  " Fall back to Django template syntax
  syntax include @Jinja syntax/django.vim

  syn cluster djangoBlocks add=djangoTagBlock,djangoVarBlock,djangoComment,djangoComBlock
  syn region djangoTagBlock start="{%" end="%}" contains=djangoStatement,djangoFilter,djangoArgument,djangoTagError display containedin=ALLBUT,@djangoBlocks
  syn region djangoVarBlock start="{{" end="}}" contains=djangoFilter,djangoArgument,djangoVarError display containedin=ALLBUT,@djangoBlocks
  syn region djangoComBlock start="{#" end="#}" contains=djangoTodo containedin=ALLBUT,@djangoBlocks
endif

syn keyword salt_stateInclude include extend containedin=yamlBlockMappingKey
highlight link salt_stateInclude Include

syn keyword salt_stateSpecialArgs name names check_cmd listen listen_in onchanges onchanges_in onfail onfail_in onlyif prereq prereq_in require require_in unless use use_in watch watch_in containedin=yamlBlockMappingKey
highlight link salt_stateSpecialArgs Special

syn keyword salt_stateErrors requires requires_in watches watches_in includes extends containedin=yamlBlockMappingKey
highlight link salt_stateErrors Error

let g:NERDCustomDelimiters = {
  \ 'sls': { 'left': '#' },
\ }

let b:current_syntax = "sls"
