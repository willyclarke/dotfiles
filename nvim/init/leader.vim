
" ---- Define the leader {{{
let mapleader="\<space>"
let maplocalleader="\<space>"
" }}}

" Leader setup {{{
"nnoremap <Leader>mm : Make<CR>  " NOTE: when using 'M'ake it maps to tpope's dispatch
nnoremap <Leader>mm : Dispatch<CR>  " NOTE: when using '!' to run in the background.
nnoremap <Leader>fs : w<CR>
" print the unicode character (on the next line)
nnoremap <Leader>u mz"zylo<C-r>=printf('U+%04X', char2nr(@z))<CR><ESC>`z
" Simple file browser using netrw
nnoremap <leader>e :e %:h/<CR>
nnoremap <leader>v :vsp %:h/<CR>
nnoremap <leader>s :sp %:h/<CR>
nnoremap <leader>t :vertical split<CR><C-w>l :terminal<CR>
" Swap between c/cpp and h file.
nnoremap <Leader>oc :e %<.cpp<CR>
nnoremap <Leader>oh :e %<.h<CR>
nnoremap <Leader>oC :e %<.c<CR>
nnoremap <Leader>oH :e %<.hpp<CR>
" Alternative: set up a global mark when leaving a file.
" Go to previous source file with mark C
autocmd BufLeave *.{h,hpp} mark H
autocmd BufLeave *.{c,cpp} mark C

" NOW WE CAN:
" - Take over the world
" Set up the build system
" }}}

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
