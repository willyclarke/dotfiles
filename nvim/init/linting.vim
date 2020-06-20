
" Linter setup (ale) {{{
let g:ale_linters = {'cpp': ['clangcheck'],}
let g:ale_sign_column_always = 1
let g:ale_cpp_clang_options = '-std=c++11 -Wall'
let g:ale_completion_enabled = 1
"
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tagbar#flags = 'f' " Show function names
" }}}

" Linter setup (syntastic) {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "☠"
"let g:syntastic_error_symbol = "\u2717"
"let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_cpp_checkers = ["clang_check"]
let g:syntastic_clang_check_config_file = ".clang_complete"
let g:syntastic_debug = 0
let g:syntastic_debug_file = "~/syntastic.log"
" }}}

" Linter setup (ncm2) {{{
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })
" }}}

" Rust programming language setup {{{
augroup MyRustProgGroup
   autocmd!
   let g:rustfmt_autosave = 1
    autocmd FileType rs nnoremap <buffer><Leader>cf :<C-u>RustFmt<CR>
    autocmd FileType rs vnoremap <buffer><Leader>cf :RustFmt<CR>
augroup END
" }}}

