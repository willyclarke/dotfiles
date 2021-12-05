
" Normal mode mappings" {{{
" My mappings - comments are not so easy for mappings
" ==============================================================================
" Add " around words.
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" Add " around words.
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" Move a line downwards
nnoremap - ddp
nnoremap <C-j> :m .+1<CR>==
" Move a line upwards
nnoremap _ kddpk
nnoremap <C-k> :m .-2<CR>==

" Remap the ; key to the : to simplify use of commands, and wise versa.
nnoremap : ;
nnoremap ; :
" List buffers (using fzf)
nnoremap <leader>bb :Buffers<CR>
" Mappings for NerdTree.
nnoremap <leader><tab> :NERDTreeToggle<cr>
" Remap the C-g which normally shows info about the file to show info about
" the current method.
nnoremap <C-g> :echo getline(search('\v^[[:alpha:]$_]', "bn", 1, 100))<CR>
"As an alternative to
"nnoremap <C-g> :Lost<CR>
" ==================  make sarches always appear in centre of page
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz
" clear search highlighting with enter
nnoremap <cr> :noh<CR><CR>:<backspace>

" Undo plugin settings. {{{
nnoremap <silent> <F6> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
" }}}

:nnoremap <silent><F8> :Dispatch<CR>
:nnoremap <silent><F9> :set paste!<CR>
" From Steve Losh youtube walkthrough : Close all other folds but the one I am
" on at the moment.
nnoremap <leader>z zMzvzz
nnoremap <tab> %
" copy current absolute filename into register
nnoremap <leader>fn :let @*=expand('%:p')<CR>
" yank file of which filename was already copied into register.
nnoremap <leader>yf :%y+<cr>
" gtags/gnu global mapping
nnoremap <leader>] :GtagsCursor<CR>
" Also remap the ctags goto to the gtags
nnoremap <C-]> :GtagsCursor<CR>

if g:os == "Darwin"
  nmap <silent> <leader>d <plug>DashSearch
endif

" Make it easier to make it easier to edit the .vimrc {{{
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>se :source $MYVIMRC<CR>
" }}}

" }}}
