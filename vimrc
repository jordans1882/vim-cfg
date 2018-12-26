" {{{ Document Header
" Purpose: Source Configuration
" }}} Document Header

" Note: Skip initialization for vim-tiny or vim-small.
" if 1
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
" endif

colorscheme onedark " TODO: Figure out appropriate place for this

" vim: set foldmethod=marker :
