""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax plugin for filetype name.
" Maintainer:	Israel Chauca F. <israelchauca@gmail.com>
" Version:	0.1
" Description:	Long description.
" Last Change:	2012-06-22
" License:	Vim License (see :help license)
" Location:	syntax/efmc.vim
" Website:	https://github.com/dahu/efmc
"
" See efmc.txt for help. This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help efmc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:efmc_version = '0.1'

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

syn match     EFMCError /\S\+/
syn match     EFMCKeyword /\h\w*/
syn region    EFMCString  start=/'/ skip=/''/  end=/'/
syn region    EFMCRegex   start=+/+ skip=+\\/+ end=+/+
syn match     EFMCComment +#.*$+ contains=EFMCTodo
syn keyword   EFMCTodo	TODO FIXME XXX contained

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link EFMCError   Error
hi def link EFMCRegex   Type
hi def link EFMCString  String
hi def link EFMCKeyword Keyword
hi def link EFMCComment Comment
hi def link EFMCTodo	Todo

let b:current_syntax = "efmc"

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:

