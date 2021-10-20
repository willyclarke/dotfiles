
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
let g:indentLine_char_list = ['|', '.', ':', '$']
" }}}

" Set up Language Server Protocol highlighting {{{
let g:lsp_cxx_hl_use_text_props = 1
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
" Getting error messages without these ...
highlight cppAccess guifg=#ff8874 ctermfg=204 guibg=#011627 ctermbg=233 gui=NONE cterm=NONE
highlight cppStructure guifg=#ff8874 ctermfg=204 guibg=#011627 ctermbg=233 gui=NONE cterm=NONE
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
highlight Comment term=bold ctermfg=darkblue guifg=#d99d18
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight Function gui=italic
highlight Function cterm=italic
"}}}

