
" Plugin Settings
"---------------------------------------------------------


" {{{ ale
if dein#tap('ale')
	let g:ale_linters = {
				\   'c': ['gcc'],
				\   'cpp': ['gcc'],
				\   'html': ['tidy'],
				\   'lua': ['luacheck'],
				\   'r': ['lintr'],
				\   'rmd': ['lintr'],
				\   'rnoweb': ['lintr'],
				\   'rnw': ['lintr'],
				\   'tex': ['chktex'],
				\   'vim': ['vint']}
	let g:ale_sign_column_always = 1
	let g:ale_sign_error = '>>'
	let g:ale_sign_warning = '--'
	highlight clear ALEErrorSign
	highlight clear ALEWarningSign

	" Set this. Airline will handle the rest.
	let g:airline#extensions#ale#enabled = 1
	nmap <silent> <C-k> <Plug>(ale_previous_wrap)
	nmap <silent> <C-j> <Plug>(ale_next_wrap)
endif
" }}} ale
" {{{ Calendar
if dein#tap('calendar')
	let g:calendar_google_calendar = 1
	let g:calendar_google_task = 1
endif
" }}} Calendar
" {{{ Denite Options
if dein#tap('denite.nvim')
	"nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh<CR>
	nnoremap <silent><LocalLeader>f :<C-u>Denite file/rec<CR>
	nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file/old -default-action=switch<CR>
	nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec -default-action=cd<CR>
	nnoremap <silent><LocalLeader>v :<C-u>Denite register -buffer-name=register<CR>
	xnoremap <silent><LocalLeader>v :<C-u>Denite register -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
	nnoremap <silent><LocalLeader>g :<C-u>Denite grep<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file/point<CR>
	nnoremap <silent><LocalLeader>u :<C-u>Denite junkfile:new junkfile<CR>
	nnoremap <silent><LocalLeader>o :<C-u>Denite outline<CR>
	nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><expr> <LocalLeader>t &filetype == 'help' ? "g\<C-]>" :
		\ ":\<C-u>DeniteCursorWord -buffer-name=tag
		\  tag:include\<CR>"
	nnoremap <silent><expr> <LocalLeader>p  &filetype == 'help' ?
		\ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"
	nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>Denite line<CR>
	nnoremap <silent><LocalLeader>* :<C-u>DeniteCursorWord line<CR>
	nnoremap <silent><LocalLeader>z :<C-u>Denite z<CR>
	nnoremap <silent><LocalLeader>; :<C-u>Denite command command_history<CR>

	" chemzqm/denite-git
	nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all<CR>
	nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus<CR>
	nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch<CR>

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite grep:::'.@/<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction
endif
" }}} Denite Options
" {{{ deoplete
if dein#tap('deoplete.nvim')
	let g:deoplete#enable_at_startup = 1
endif
" }}} deoplete
" {{{ neosnippet
if dein#tap('neosnippet')
	" Plugin key-mappings.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>     <Plug>(neosnippet_expand_target)

	" SuperTab like snippets behavior.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	"imap <expr><TAB>
	" \ pumvisible() ? "\<C-n>" :
	" \ neosnippet#expandable_or_jumpable() ?
	" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

	" For conceal markers.
	if has('conceal')
		set conceallevel=2 concealcursor=niv
	endif
		let g:deoplete#enable_at_startup = 1
endif
" }}} neosnippet
"  NERDTree {{{
if dein#tap('nerdtree')
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	let g:NERDTreeDirArrowExpandable = '▸'
	let g:NERDTreeDirArrowCollapsible = '▾'
	let g:NERDTreeWinPos = 'right'
	map <C-n> :NERDTreeToggle<CR>
	let g:NERDTreeMapOpenSplit = 'sv'
	let g:NERDTreeMapOpenVSplit = 'sg'
	let g:NERDTreeMapOpenInTab = 'st'
	let g:NERDTreeMapOpenInTabSilent = 'sT'
	let g:NERDTreeMapUpdirKeepOpen = '<BS>'
	let g:NERDTreeMapOpenRecursively = 't'
	let g:NERDTreeMapCloseChildren = 'T'
	let g:NERDTreeMapToggleHidden = '.'
	let g:NERDTreeQuitOnOpen = 1
endif

" NERDTree }}}
" {{{ nvim-r
if dein#tap('nvim-r')
	let R_in_buffer = 0
	let R_term="alacritty"
	let R_assign = 2
endif
" }}} nvim-r
"  python-mode {{{
if dein#tap('python-mode')
	let g:pymode = 1
	let g:pymode_python = 'python3'
endif

" NERDTree }}}
"  SuperTab {{{
if dein#tap('supertab')
	let g:SuperTabMappingForward = '<s-tab>' " (default value: '<tab>')
	let g:SuperTabMappingBackward = '<tab>' " (default value: '<s-tab>')
endif
" SuperTab }}}
 "  tagbar {{{
 if dein#tap('tagbar')
	 let g:tagbar_left = 1
 endif
 " tagbar }}}
" {{{ vim-airline
if dein#tap('vim-airline')
	let g:airline#extensions#tabline#enabled = 1
	set laststatus=2
	let g:airline#extensions#whitespace#checks = ['trailing']
	let g:airline#extensions#whitespace#mixed_indent_algo = 1
	let g:airline_theme='onedark'
	let g:airline_powerline_fonts = 1
endif
" }}} airline
" {{{ vim-indent-guides
if dein#tap('vim-indent-guides')
	let g:indent_guides_guide_size = 1
	let g:indent_guides_color_change_percent = 3
	let g:indent_guides_enable_on_vim_startup = 1
	let g:indent_guides_auto_colors = 0
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=241
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=238
	set ts=2 sw=2 et
endif
" }}} vim-indent-guides
" vim-cmake {{{
if dein#tap('vim-cmake')
	let g:cmake_cxx_compiler='g++'
endif
" vim-cmake }}}
" {{{ vim-easygit
if dein#tap('vim-easygit')
	let g:easygit_enable_command = 1
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gD :Gdiffoff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gB :Gbrowse<CR>
	nnoremap <silent> <leader>gS :Gstatus<CR>
	nnoremap <silent> <leader>gp :Gpush<CR>
endif
" }}} vim-easygit
" {{{ vim-project
if dein#tap('vim-project')
	let g:project_use_nerdtree = 1
	let g:project_enable_welcome = 0
	set rtp+=~/.vim/bundle/vim-project/
	call project#rc("~/Code")
	Project  'scratch'
	Project  '~/work/gleason/gleason-research' , 'gleason'
	Project  '~/school/fall_2018/comptag/reconstruction' , 'reconstruction'
	Project  '~/school/fall_2018/ustat_paper/ml_project' , 'ustat'
	Project  '~/.config/nvim/' , 'vimrc'
	Project  '~/.config/awesome' , 'awesomerc'
endif
" }}} vim-project
" {{{ vim-slime
if dein#tap('vim-slime')
	let g:slime_target = "tmux"
	let g:slime_python_ipython = 1
endif
" }}} vim-slime
" {{{ which-key
if dein#tap('vim-which-key')
	let g:which_key_map = {}

	let g:which_key_map['a'] = {
			\ 'name' : '+applications' ,
			\ 's' : ['Deol'    , 'Deol']            ,
			\ 'c' : ['Calendar'    , 'Calendar']            ,
			\ }
	let g:which_key_map.b = {
				\ 'name' : '+buffer' ,
				\ '?' : ['Buffers'   , 'fzf-buffer']      ,
				\ '1' : ['b1'        , 'buffer 1']        ,
				\ '2' : ['b2'        , 'buffer 2']        ,
				\ 'd' : ['bd'        , 'delete-buffer']   ,
				\ 'f' : ['bfirst'    , 'first-buffer']    ,
				\ 'h' : ['Startify'  , 'home-buffer']     ,
				\ 'l' : ['blast'     , 'last-buffer']     ,
				\ 'n' : ['bnext'     , 'next-buffer']     ,
				\ 'p' : ['bprevious' , 'previous-buffer'] ,
				\ 's' : ['w' , 'Write Buffer'] ,
				\ 'S' : ['w!' , 'Force Write Buffer'] ,
				\ 'w' : ['Welcome'  , 'welcome-buffer']     ,
				\ }
	let g:which_key_map['c'] = {
			\ 'name' : '+compile' ,
			\ 'c' : ['CMake'    , 'Run CMake']            ,
			\ 'm' : ['make'    , 'Run Make']            ,
			\ }
	let g:which_key_map.e = {
				\ 'name' : '+easyjump' ,
				\ 'e' : ['<Plug>(easymotion-overwin-f2)'        , 'easymotion']        ,
				\ }
	let g:which_key_map.f = {
				\ 'name' : '+files' ,
				\ 'f' : ['NERDTree'   , 'File Browser']      ,
				\ }
	let g:which_key_map.g = {
				\ 'name' : '+git' ,
				\ 'a' : ['Gadd'   , 'Git Add']      ,
				\ 'd' : ['Gdiff'   , 'Git Diff']      ,
				\ 'p' : ['Gpush'   , 'Git Push']      ,
				\ 's' : ['Gstatus'   , 'Git Status']      ,
				\ }
	let g:which_key_map.l = {
			\ 'name' : '+lsp'                                            ,
			\ 'f' : ['LanguageClient#textDocument_formatting()'     , 'formatting']       ,
			\ 'h' : ['LanguageClient#textDocument_hover()'          , 'hover']            ,
			\ 'r' : ['LanguageClient#textDocument_references()'     , 'references']       ,
			\ 'R' : ['LanguageClient#textDocument_rename()'         , 'rename']           ,
			\ 's' : ['LanguageClient#textDocument_documentSymbol()' , 'document-symbol']  ,
			\ 'S' : ['LanguageClient#workspace_symbol()'            , 'workspace-symbol'] ,
			\ 'g' : {
				\ 'name': '+goto',
				\ 'd' : ['LanguageClient#textDocument_definition()'     , 'definition']       ,
				\ 't' : ['LanguageClient#textDocument_typeDefinition()' , 'type-definition']  ,
				\ 'i' : ['LanguageClient#textDocument_implementation()'  , 'implementation']  ,
				\ },
			\ }
	let g:which_key_map.t = {
			\ 'name' : '+tab'                                            ,
			\ 'c' : ['tabnew'     , 'New Tab']       ,
			\ 'l' : ['tabs'     , 'List Tabs']       ,
			\ 'n' : ['tabnext'     , 'Next Tab']       ,
			\ 'p' : ['tabprevious'     , 'Previous Tab']       ,
			\ 'd' : ['tabclose'     , 'Close Tab']       ,
			\ }
	let g:which_key_map.T = {
			\ 'name' : '+tags'                                            ,
			\ 'T' : ['TagbarToggle'     , 'Toggle Tagbar']       ,
			\ }
	let g:which_key_map['w'] = {
			\ 'name' : '+windows' ,
			\ 'w' : ['<C-W>w'     , 'other-window']          ,
			\ 'd' : ['<C-W>c'     , 'delete-window']         ,
			\ '-' : ['<C-W>s'     , 'split-window-below']    ,
			\ '|' : ['<C-W>v'     , 'split-window-right']    ,
			\ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
			\ 'h' : ['<C-W>h'     , 'window-left']           ,
			\ 'j' : ['<C-W>j'     , 'window-below']          ,
			\ 'l' : ['<C-W>l'     , 'window-right']          ,
			\ 'k' : ['<C-W>k'     , 'window-up']             ,
			\ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
			\ 'J' : ['resize +5'  , 'expand-window-below']   ,
			\ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
			\ 'K' : ['resize -5'  , 'expand-window-up']      ,
			\ '=' : ['<C-W>='     , 'balance-window']        ,
			\ 's' : ['<C-W>s'     , 'split-window-below']    ,
			\ 'v' : ['<C-W>v'     , 'split-window-below']    ,
			\ '?' : ['Windows'    , 'fzf-window']            ,
			\ }
	let g:which_key_map.z = {
			\ 'name' : '+fold'                                            ,
			\ 'c' : ['tabnew'     , 'New Fold']       ,
			\ }

call which_key#register(',', "g:which_key_map")
 " call which_key#register('l', "g:which_key_map")

nnoremap <silent> , :WhichKey ','<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ';'<CR>
"	vnoremap <silent> <localleader> :WhichKey ';'<CR>
endif
" }}} deoplete
" {{{ languageclient
if dein#tap('LanguageClient-neovim')
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'stable', 'rls'],
        \ }
endif
" }}} languageclient

" Ye Olde Plugin Settings
"---------------------------------------------------------

" " {{{ neosnippet
" if dein#tap('neosnippet.vim')
" 	imap <expr><C-o> neosnippet#expandable_or_jumpable()
" 		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
" 	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
" 	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
" 	xmap <silent>L     <Plug>(neosnippet_expand_target)
" endif
" " }}} neosnippet
" " vim-asyncmake {{{
" if dein#tap('vim-asyncmake')
"   let b:asyncmakeprg = "g++ %"
" endif
" " vim-asyncmake }}}
" " {{{ vim-colorschemes
" if dein#tap('vim-colorschemes')
" 	colorscheme Atelier_HeathDark
" endif
" " }}} vim-colorschemes
" " {{{ vimfiler
" if dein#tap('vimfiler.vim')
" 	let g:vimfiler_as_default_explorer = 1
" endif
" " }}} vimfiler
"
" " {{{ Old settings
" " if dein#tap('vim-denite-z')
" " 	command! -nargs=+ -complete=file Z
" " 		\ call denite#start([{'name': 'z', 'args': [<q-args>], {'immediately': 1}}])
" " endif
" "
" " if dein#tap('tagbar')
" " 	nnoremap <silent> <Leader>o   :<C-u>TagbarOpenAutoClose<CR>
" "
" " 	" Also use h/l to open/close folds
" " 	let g:tagbar_map_closefold = ['h', '-', 'zc']
" " 	let g:tagbar_map_openfold = ['l', '+', 'zo']
" " endif
" "
" " if dein#tap('nerdtree')
" " 	let g:NERDTreeMapOpenSplit = 'sv'
" " 	let g:NERDTreeMapOpenVSplit = 'sg'
" " 	let g:NERDTreeMapOpenInTab = 'st'
" " 	let g:NERDTreeMapOpenInTabSilent = 'sT'
" " 	let g:NERDTreeMapUpdirKeepOpen = '<BS>'
" " 	let g:NERDTreeMapOpenRecursively = 't'
" " 	let g:NERDTreeMapCloseChildren = 'T'
" " 	let g:NERDTreeMapToggleHidden = '.'
" "
" " 	nnoremap <silent> <LocalLeader>e :<C-u>NERDTreeToggle<CR>
" " 	nnoremap <silent> <LocalLeader>a :<C-u>NERDTreeFind<CR>
" " endif
" "
" " if dein#tap('neosnippet.vim')
" " 	imap <expr><C-o> neosnippet#expandable_or_jumpable()
" " 		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
" " 	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
" " 	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
" " 	xmap <silent>L     <Plug>(neosnippet_expand_target)
" " endif
" "
" " if dein#tap('emmet-vim')
" " 	autocmd MyAutoCmd FileType html,css,jsx,javascript,javascript.jsx
" " 		\ EmmetInstall
" " 		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
" " endif
" "
" " if dein#tap('vim-operator-surround')
" " 	map <silent>sa <Plug>(operator-surround-append)
" " 	map <silent>sd <Plug>(operator-surround-delete)
" " 	map <silent>sr <Plug>(operator-surround-replace)
" " 	nmap <silent>saa <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
" " 	nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" " 	nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" " endif
" "
" " if dein#tap('vim-operator-replace')
" " 	xmap p <Plug>(operator-replace)
" " endif
" "
" " if dein#tap('vim-operator-flashy')
" " 	map y <Plug>(operator-flashy)
" " 	nmap Y <Plug>(operator-flashy)$
" " endif
" "
" " if dein#tap('vim-niceblock')
" " 	xmap I  <Plug>(niceblock-I)
" " 	xmap A  <Plug>(niceblock-A)
" " endif
" "
" " if dein#tap('accelerated-jk')
" " 	nmap <silent>j <Plug>(accelerated_jk_gj)
" " 	nmap <silent>k <Plug>(accelerated_jk_gk)
" " endif
" "
" " if dein#tap('vim-edgemotion')
" " 	map gj <Plug>(edgemotion-j)
" " 	map gk <Plug>(edgemotion-k)
" " 	xmap gj <Plug>(edgemotion-j)
" " 	xmap gk <Plug>(edgemotion-k)
" " endif
" "
" " if dein#tap('vim-quickhl')
" " 	nmap <Leader>, <Plug>(quickhl-manual-this)
" " 	xmap <Leader>, <Plug>(quickhl-manual-this)
" " endif
" "
" " if dein#tap('vim-sidemenu')
" " 	nmap <Leader>l <Plug>(sidemenu)
" " 	xmap <Leader>l <Plug>(sidemenu-visual)
" " endif
" "
" " if dein#tap('vim-indent-guides')
" " 	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
" " endif
" "
" " if dein#tap('vim-bookmarks')
" " 	nmap ma :<C-u>cgetexpr bm#location_list()<CR>
" " 		\ :<C-u>Denite quickfix -buffer-name=list<CR>
" " 	nmap mn <Plug>BookmarkNext
" " 	nmap mp <Plug>BookmarkPrev
" " 	nmap mm <Plug>BookmarkToggle
" " 	nmap mi <Plug>BookmarkAnnotate
" " endif
" "
" " if dein#tap('committia.vim')
" " 	let g:committia_hooks = {}
" " 	function! g:committia_hooks.edit_open(info)
" " 		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
" " 		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
" "
" " 		setlocal winminheight=1 winheight=1
" " 		resize 10
" " 		startinsert
" " 	endfunction
" " endif
" "
" " if dein#tap('python_match.vim')
" " 	nmap <buffer> {{ [%
" " 	nmap <buffer> }} ]%
" " endif
" "
" " if dein#tap('goyo.vim')
" " 	nnoremap <Leader>G :Goyo<CR>
" " endif
" "
" " if dein#tap('vim-peekaboo')
" " 	nnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  0)<cr>
" " 	xnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  1)<cr>
" " 	nnoremap <buffer> <silent> @ :<c-u>call peekaboo#peek(v:count1, 'replay', 0)<cr>
" " 	inoremap <buffer> <silent> <c-r> <c-o>:call peekaboo#peek(1, 'ctrl-r',  0)<cr>
" " endif
" "
" " if dein#tap('vimwiki')
" " 	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
" " endif
" "
" " if dein#tap('vim-choosewin')
" " 	nmap -         <Plug>(choosewin)
" " 	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
" " endif
" "
" " if dein#tap('jedi-vim')
" " 	let g:jedi#completions_command = ''
" " 	let g:jedi#documentation_command = 'K'
" " 	let g:jedi#goto_command = '<C-]>'
" " 	let g:jedi#goto_assignments_command = '<leader>g'
" " 	let g:jedi#rename_command = '<Leader>r'
" " 	let g:jedi#usages_command = '<Leader>n'
" " endif
" "
" " if dein#tap('tern_for_vim')
" " 	autocmd MyAutoCmd FileType javascript,jsx,javascript.jsx
" " 		\  nnoremap <silent><buffer> K          :<C-u>TernDoc<CR>
" " 		\| nnoremap <silent><buffer> <C-]>      :<C-u>TernDefSplit<CR>
" " 		\| nnoremap <silent><buffer> <leader>g  :<C-u>TernType<CR>
" " 		\| nnoremap <silent><buffer> <leader>n  :<C-u>TernRefs<CR>
" " 		\| nnoremap <silent><buffer> <leader>r  :<C-u>TernRename<CR>
" " endif
" "
" " if dein#tap('vim-gitgutter')
" " 	nmap <Leader>hj <Plug>GitGutterNextHunk
" " 	nmap <Leader>hk <Plug>GitGutterPrevHunk
" " 	nmap <Leader>hs <Plug>GitGutterStageHunk
" " 	nmap <Leader>hr <Plug>GitGutterUndoHunk
" " 	nmap <Leader>hp <Plug>GitGutterPreviewHunk
" " endif
" "
" " if dein#tap('vim-go')
" " 	autocmd MyAutoCmd FileType go
" " 		\   nmap <C-]> <Plug>(go-def)
" " 		\ | nmap <Leader>god  <Plug>(go-describe)
" " 		\ | nmap <Leader>goc  <Plug>(go-callees)
" " 		\ | nmap <Leader>goC  <Plug>(go-callers)
" " 		\ | nmap <Leader>goi  <Plug>(go-info)
" " 		\ | nmap <Leader>gom  <Plug>(go-implements)
" " 		\ | nmap <Leader>gos  <Plug>(go-callstack)
" " 		\ | nmap <Leader>goe  <Plug>(go-referrers)
" " 		\ | nmap <Leader>gor  <Plug>(go-run)
" " 		\ | nmap <Leader>gov  <Plug>(go-vet)
" " endif
" "
" " if dein#tap('phpcomplete-extended')
" " 	autocmd MyAutoCmd FileType php
" " 		\   nmap <silent> <unique> K <Plug>(phpcomplete-extended-doc)
" " 		\ | nmap <silent> <unique> <C-]> <Plug>(phpcomplete-extended-goto)
" " 		\ | nmap <silent> <unique> <Leader>a <Plug>(phpcomplete-extended-add-use)
" " endif
" "
" " if dein#tap('vimagit')
" " 	nnoremap <silent> mg :Magit<CR>
" "
" " 	" autocmd MyAutoCmd FileType magit
" " 	" 	\ nnoremap <silent><buffer> <CR> za
" " endif
" "
" " if dein#tap('vim-easygit')
" " 	nnoremap <silent> <leader>gd :Gdiff<CR>
" " 	nnoremap <silent> <leader>gD :Gdiffoff<CR>
" " 	nnoremap <silent> <leader>gc :Gcommit<CR>
" " 	nnoremap <silent> <leader>gb :Gblame<CR>
" " 	nnoremap <silent> <leader>gB :Gbrowse<CR>
" " 	nnoremap <silent> <leader>gS :Gstatus<CR>
" " 	nnoremap <silent> <leader>gp :Gpush<CR>
" " endif
" "
" " if dein#tap('undotree')
" " 	nnoremap <Leader>gu :UndotreeToggle<CR>
" " endif
" "
" " if dein#tap('vim-online-thesaurus')
" " 	nnoremap <silent> <Leader>K :<C-u>OnlineThesaurusCurrentWord<CR>
" " endif
" "
" " if dein#tap('vim-asterisk')
" " 	map *   <Plug>(asterisk-g*)
" " 	map g*  <Plug>(asterisk-*)
" " 	map #   <Plug>(asterisk-g#)
" " 	map g#  <Plug>(asterisk-#)
" "
" " 	map z*  <Plug>(asterisk-z*)
" " 	map gz* <Plug>(asterisk-gz*)
" " 	map z#  <Plug>(asterisk-z#)
" " 	map gz# <Plug>(asterisk-gz#)
" " endif
" "
" " if dein#tap('vim-expand-region')
" " 	xmap v <Plug>(expand_region_expand)
" " 	xmap V <Plug>(expand_region_shrink)
" " endif
" "
" " if dein#tap('sideways.vim')
" " 	nnoremap <silent> m" :SidewaysJumpLeft<CR>
" " 	nnoremap <silent> m' :SidewaysJumpRight<CR>
" " 	omap <silent> a, <Plug>SidewaysArgumentTextobjA
" " 	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
" " 	omap <silent> i, <Plug>SidewaysArgumentTextobjI
" " 	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
" " endif
" "
" " if dein#tap('splitjoin.vim')
" " 	let g:splitjoin_join_mapping = ''
" " 	let g:splitjoin_split_mapping = ''
" " 	nmap sj :SplitjoinJoin<CR>
" " 	nmap sk :SplitjoinSplit<CR>
" " endif
" "
" " if dein#tap('linediff.vim')
" " 	vnoremap ,df :Linediff<CR>
" " 	vnoremap ,da :LinediffAdd<CR>
" " 	nnoremap ,ds :<C-u>LinediffShow<CR>
" " 	nnoremap ,dr :<C-u>LinediffReset<CR>
" " endif
" "
" " if dein#tap('dsf.vim')
" " 	nmap dsf <Plug>DsfDelete
" " 	nmap csf <Plug>DsfChange
" " endif
" "
" " if dein#tap('vim-commentary')
" " 	xmap <Leader>v  <Plug>Commentary
" " 	nmap <Leader>v  <Plug>CommentaryLine
" " 	xmap gc  <Plug>Commentary
" " 	nmap gc  <Plug>Commentary
" " 	omap gc  <Plug>Commentary
" " 	nmap gcc <Plug>CommentaryLine
" " 	nmap cgc <Plug>ChangeCommentary
" " 	nmap gcu <Plug>Commentary<Plug>Commentary
" " endif
" "
" " if dein#tap('vim-easymotion')
" " 	nmap ss <Plug>(easymotion-s2)
" " 	nmap sd <Plug>(easymotion-s)
" " 	nmap sf <Plug>(easymotion-overwin-f)
" " 	map  sh <Plug>(easymotion-linebackward)
" " 	map  sl <Plug>(easymotion-lineforward)
" " 	" map  sj <Plug>(easymotion-j)
" " 	" map  sk <Plug>(easymotion-k)
" " 	map  s/ <Plug>(easymotion-sn)
" " 	omap s/ <Plug>(easymotion-tn)
" " 	map  sn <Plug>(easymotion-next)
" " 	map  sp <Plug>(easymotion-prev)
" " endif
" "
" " if dein#tap('vim-textobj-multiblock')
" " 	omap <silent> ab <Plug>(textobj-multiblock-a)
" " 	omap <silent> ib <Plug>(textobj-multiblock-i)
" " 	xmap <silent> ab <Plug>(textobj-multiblock-a)
" " 	xmap <silent> ib <Plug>(textobj-multiblock-i)
" " endif
" "
" " if dein#tap('vim-textobj-function')
" " 	omap <silent> af <Plug>(textobj-function-a)
" " 	omap <silent> if <Plug>(textobj-function-i)
" " 	xmap <silent> af <Plug>(textobj-function-a)
" " 	xmap <silent> if <Plug>(textobj-function-i)
" " endif
" " }}} Old settings

" vim: set ts=2 sw=2 tw=80 noet foldmethod=marker :

