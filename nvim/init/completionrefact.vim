" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Auto popup
" By default asyncomplete will automatically show the autocomplete popup menu as you start typing.
" If you would like to disable the default behavior set g:asyncomplete_auto_popup to 0"
"let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"" Preview Window
"" To enable preview window:
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

"
"To auto close preview window when completion is done.
"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <Plug>(lsp-definition)
    nmap <buffer> gr <Plug>(lsp-references)
    nmap <buffer> gi <Plug>(lsp-implementation)
    nmap <buffer> gt <Plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <Plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <Plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Remap keys for gotos
"nmap <silent> gd <Plug>(lsp-definition)
"nmap <silent> gy <Plug>(lsp-type-definition)
"nmap <silent> gi <Plug>(lsp-implementation)
"nmap <silent> gr <Plug>(lsp-references)

"nmap <leader>rn <Plug>(lsp-rename)
"nmap [g <Plug>(lsp-previous-diagnostic)
"nmap ]g <Plug>(lsp-next-diagnostic)
"nmap K <Plug>(lsp-hover)

"" Use 'k' to show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute 'LspHover'
  endif
endfunction
