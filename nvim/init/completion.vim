
" Clang function {{{
augroup ClangFormatSettings
    autocmd!
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
augroup END

" -----------------------------------------------------------
" Pasted from
" https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html
" -----------------------------------------------------------
function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check" . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F5> :call ClangCheck()<CR><CR>

" }}}

" Set up of mu-complete {{{
augroup MyMuSetup
"set completeopt+=menuone
"set completeopt+=noselect
"set completeopt+=noinsert
"set shortmess+=c   " Shut off completion messages
"set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect
" The following line assumes `brew install llvm` in macOS
let g:clang_library_path = '/usr/lib/llvm-3.9/lib/libclang.so'
let g:clang_user_options = '-std=c++11'
let g:clang_complete_auto = 1
augroup END
" }}}

" My deoplete setup {{{
" now we can autocomplete...
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.9/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.9'
let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++1z', 'objc': 'c11', 'objcpp': 'c++1z'}
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#clang_complete_database = '/home/willy/Development/git'
"}}}

" Language server setup {{{
" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)

" By default asyncomplete will automatically show the autocomplete
" popup menu as you start typing. If you would like to disable the
" default behvior set g:asyncomplete_auto_popup to 0.
let g:asyncomplete_auto_popup = 0

" You can use the above <Plug>(asyncomplete_force_refresh) to show
" the popup or can you tab to show the autocomplete.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" To disable preview window:
set completeopt-=preview

" To enable preview window:
"set completeopt+=preview

" To auto close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

 " Debug of clang language client {{{
 let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }

 let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'
 " }}}

augroup languageserver
   autocmd!
   function! SetLSPShortcuts()
     " ...
     " Previous bindings
     " ...
     nnoremap <leader>ll :call LanguageClient#debugInfo()<CR>
   endfunction
augroup end

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" Remap keys for gotos
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-type-definition)
nmap <silent> gi <Plug>(lsp-implementation)
nmap <silent> gr <Plug>(lsp-references)

"" Use 'k' to show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute 'LspHover'
  endif
endfunction

" }}}

" {{{ https://github.com/prabirshrestha/asyncomplete.vim
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" Force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Auto popup
" By default asyncomplete will automatically show the autocomplete popup menu as you start
" typing. If you would like to disable the default behavior set g:asyncomplete_auto_popup
" to 0.
let g:asyncomplete_auto_popup = 0
"}}}
