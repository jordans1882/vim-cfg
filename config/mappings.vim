" Key-mappings
"---------------------------------------------------------

" TODO: Figure out organization for this file...
" Source current file with Control-C
nmap <C-C> :w<CR>:so %<CR> " consider a different mapping

" Non-standard {{{
" ------------

" TODO: Go through below this line
" Window-control prefix " How is this used?
nnoremap  [Window]   <Nop>
nmap      s [Window]

" Fix keybind name for Ctrl+Spacebar... Is this used somewhere else?
map <Nul> <C-Space>
map! <Nul> <C-Space>

" Disable arrow movement, resize splits instead.
if exists('g:elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" Double leader key for toggling visual-line mode... What's wrong with v?
nmap <silent> <Leader><Leader> V
vmap <Leader><Leader> <Esc>

" Chang next (repeatable change instance of word under cursor)
nnoremap cn *``cgn
nnoremap cN *``cgN

" Change selected word in a repeatable manner
vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

nnoremap cp yap<S-}>p " Copy paragraph?
nnoremap <leader>a =ip " What's this supposed to do

" Default registers for print and cut?
" xnoremap p  "0p
" nnoremap x "_x

" Toggle fold
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <S-Return> zMza

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Pane movement
nmap <Tab>  <C-w>w
nmap <S-Tab>  <C-w>W

nnoremap cf    :cd %:p:h <CR>


"}}}
" Editor UI {{{
" ---------

" I like to :quit with 'q', shrug.
nnoremap <silent> q :<C-u>:quit<CR>
" autocmd MyAutoCmd FileType man nnoremap <silent><buffer> q :<C-u>:quit<CR>

" Macros
nnoremap Q q
nnoremap gQ @q

" Show highlight names under cursor
nmap <silent> gh :echo 'hi<'.synIDattr(synID(line('.'), col('.'), 1), 'name')
	\.'> trans<'.synIDattr(synID(line('.'), col('.'), 0), 'name').'> lo<'
	\.synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name').'>'<CR>

" Toggle editor visuals
nmap <silent> <Leader>ts :setlocal spell!<cr>
nmap <silent> <Leader>tn :setlocal nonumber!<CR>
nmap <silent> <Leader>tl :setlocal nolist!<CR>
nmap <silent> <Leader>th :nohlsearch<CR>
nmap <silent> <Leader>tw :setlocal wrap! breakindent!<CR>

" Tabs
nnoremap <silent> g0 :<C-u>tabfirst<CR>
nnoremap <silent> g$ :<C-u>tablast<CR>
nnoremap <silent> gr :<C-u>tabprevious<CR>
nnoremap <silent> <A-j> :<C-U>tabnext<CR>
nnoremap <silent> <A-k> :<C-U>tabprevious<CR>
nnoremap <silent> <S-Right> :<C-U>tabnext<CR>
nnoremap <silent> <S-Left> :<C-U>tabprevious<CR>
" Uses g:lasttab set on TabLeave in MyAutoCmd
let g:lasttab = 1
nmap <silent> \\ :execute 'tabn '.g:lasttab<CR>


" }}}


" vim: set foldmethod=marker ts=2 :
