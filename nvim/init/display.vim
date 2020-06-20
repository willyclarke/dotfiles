
" Highlight ColorColumn ----------------- {{{
set colorcolumn=101                      " highligth when going over N columns.
" Override the colorscheme colors for the cursor and number line.
" The background color is the same as the night-owl theme.
highlight LineNr guifg=#387055 ctermfg=238 guibg=#011627 ctermbg=233 gui=NONE cterm=NONE
highlight ColorColumn guibg=#111927 ctermbg=235 gui=NONE cterm=NONE
highlight CursorLine guifg=#ff8874 ctermfg=204 guibg=#011627 ctermbg=233 gui=NONE cterm=NONE
" }}}

" Set up display of tabs and newlines {{{
" set listchars=tab:>~,nbsp:_,trail:.      " bread crumble the spaces and tabs
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list                                 " after the bread crumble; set the list
" }}}

" Set up Chromatica c++ colorization {{{
"
let g:chromatica#libclang_path = '/usr/lib/llvm-3.9/lib/libclang.so'
let g:chromatica#responsive_mode = 1
" }}}

" Set up syntax highlight to my likin {{{
" https://github.com/octol/vim-cpp-enhanced-highlight.git
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 0
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 0
" }}}

" Never use arrows? {{{
" Now we can:
" Disable arrow movement, resize splits instead.
let g:elite_mode = 1
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize -2<CR>
    nnoremap <Right> :vertical resize +2<CR>
endif
" }}}

" Devicons setup {{{
"
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding the custom source to unite
let g:webdevicons_enable_unite = 1
" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1
"}}}

" Set up italics to my liking {{{
"
" Note that these settings need to be below any colorscheme definition.
" Italics does require a font that supports it.
" One suggested font is Input Mono. Another one is Fira Code iScript
" https://github.com/kencrocken/FiraCodeiScript.git
highlight Comment gui=italic
highlight Comment cterm=italic
highlight Comment term=bold ctermfg=darkblue guifg=#479707
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight Function gui=italic
highlight Function cterm=italic
"}}}

" Highlight Word {{{
" NOTE:
" This code has been pasted from
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc?fileviewer=file-view-default
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

function! HiInterestingWordClear() " {{{
    silent! call clearmatches()
endfunction    "}}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
nnoremap <silent> <leader>7 :call HiInterestingWord(7)<cr>
nnoremap <silent> <leader>8 :call HiInterestingWord(8)<cr>
nnoremap <silent> <leader>9 :call HiInterestingWord(9)<cr>
nnoremap <silent> <leader>0 :call HiInterestingWordClear()<cr>

" }}}

" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
hi def InterestingWord7 guifg=#000000 ctermfg=16 guibg=#00f0ff ctermbg=195
hi def InterestingWord8 guifg=#000000 ctermfg=16 guibg=#fffc4b ctermbg=195
hi def InterestingWord9 guifg=#000000 ctermfg=16 guibg=#ff00ff ctermbg=195

" }}}

" }}}
