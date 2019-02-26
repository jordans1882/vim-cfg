" {{{ Document Header
" Filename: vimrc
" Purpose: Root Configuration... (i.e. basically a control for vanilla vs not)
" }}} Document Header

" {{{ Load non-vanilla config
if !exists("g:Vanilla")
	execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
endif
" }}} Load non-vanilla config

" vim: set foldmethod=marker ts=2 :
