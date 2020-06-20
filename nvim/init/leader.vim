
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

