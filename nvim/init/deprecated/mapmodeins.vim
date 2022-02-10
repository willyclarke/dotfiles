
" Insert mode mappings {{{
" ==============================================================================
inoremap jk <esc>
" Disable the <esc> key in insert mode for now ..."
"inoremap <esc> <nop>
"DIY autoclosing
inoremap (; ();<left><left>
inoremap [; [];<left><left>
"inoremap ( ()<left>
inoremap [ []<left>
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>)<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ``` ```<cr>```<esc>O
" jump over the doubled up chars above you can use Ctrl-l
inoremap <c-l> <right>
" Move a line downwards
inoremap <C-j> <Esc>:m .+1<CR>==gi
" Move a line upwards in insert mode
"inoremap <C-k> <Esc>:m .-2<CR>==gi
" }}}
