
" Theme setup {{{
try
set background=dark
" in case t_Co alone doesn't work, add this as well:
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"
set t_Co=256
"let g:colors_name = "duoduo"

highlight Normal guisp=#191919 guifg=#ffe2d2 guibg=#191919 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE

highlight IncSearch guifg=#000000 guibg=#90ee90 gui=NONE ctermfg=16 ctermbg=120 cterm=NONE
highlight WildMenu guisp=#ffff45 guifg=#000000 guibg=#ffff45 gui=NONE ctermfg=16 ctermbg=227 cterm=NONE
highlight SignColumn guisp=#363636 guifg=NONE guibg=#363636 gui=NONE ctermbg=237 cterm=NONE
highlight SpecialComment guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE ctermfg=214 cterm=NONE
highlight Typedef guisp=NONE guifg=#deb887 guibg=NONE gui=bold ctermfg=180 cterm=bold
highlight Title guisp=NONE guifg=#ffbfe5 guibg=NONE gui=NONE ctermfg=218 cterm=NONE
highlight Folded guisp=#383838 guifg=#999999 guibg=#383838 gui=NONE ctermfg=247 ctermbg=237 cterm=NONE
highlight PreCondit guisp=NONE guifg=#acace6 guibg=NONE gui=bold ctermfg=147 cterm=bold
highlight Include guisp=NONE guifg=#acace6 guibg=NONE gui=NONE ctermfg=147 cterm=NONE
highlight Float guisp=NONE guifg=#8f8ffe guibg=NONE gui=bold ctermfg=204 cterm=bold
highlight StatusLineNC guisp=#4d4d4d guifg=#87cfeb guibg=#4d4d4d gui=NONE ctermfg=117 ctermbg=239 cterm=NONE
highlight NonText guisp=#191919 guifg=#4d4d4d guibg=#191919 gui=NONE ctermfg=239 ctermbg=235 cterm=NONE
highlight DiffText guisp=#fa2d2d guifg=NONE guibg=#fa2d2d gui=NONE ctermbg=196 cterm=NONE
highlight ErrorMsg guisp=#fa2d2d guifg=#ffffff guibg=#fa2d2d gui=NONE ctermfg=231 ctermbg=196 cterm=NONE
highlight Ignore guisp=NONE guifg=#191919 guibg=NONE gui=NONE ctermfg=235 cterm=NONE
highlight Debug guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE ctermfg=214 cterm=NONE
highlight PMenuSbar guisp=#585858 guifg=#000000 guibg=#585858 gui=NONE ctermfg=16 ctermbg=240 cterm=NONE
highlight Identifier guisp=NONE guifg=#98fb98 guibg=NONE gui=NONE ctermfg=120 cterm=NONE
highlight SpecialChar guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE ctermfg=214 cterm=NONE
highlight Conditional guisp=NONE guifg=#f5f55d guibg=NONE gui=bold ctermfg=227 cterm=bold
highlight StorageClass guisp=NONE guifg=#deb887 guibg=NONE gui=bold ctermfg=180 cterm=bold
highlight Todo guisp=#ffff17 guifg=#0000ff guibg=#ffff17 gui=NONE ctermfg=21 ctermbg=226 cterm=NONE
highlight Special guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE ctermfg=214 cterm=NONE
highlight LineNr guisp=#2e2e2e guifg=#aaef00 guibg=#2e2e2e gui=NONE ctermfg=249 ctermbg=236 cterm=NONE
highlight LineNrAbove guisp=#2e2e2e guifg=#9b9c9a guibg=#2e2e2e gui=NONE ctermfg=249 ctermbg=236 cterm=NONE
highlight LineNrBelow guisp=#2e2e2e guifg=#9b9c9a guibg=#2e2e2e gui=NONE ctermfg=249 ctermbg=236 cterm=NONE
highlight StatusLine guisp=#4d4d4d guifg=#87ceeb guibg=#4d4d4d gui=NONE ctermfg=117 ctermbg=239 cterm=NONE
highlight Label guisp=NONE guifg=#f5f55d guibg=NONE gui=NONE ctermfg=227 cterm=NONE
highlight PMenuSel guisp=#a0cf63 guifg=#000000 guibg=#a0cf63 gui=NONE ctermfg=16 ctermbg=149 cterm=NONE
highlight Search guisp=#ffff45 guifg=#000000 guibg=#ffff45 gui=NONE ctermfg=16 ctermbg=227 cterm=NONE
highlight Delimiter guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE ctermfg=214 cterm=NONE
highlight Statement guisp=NONE guifg=#f5f55d guibg=NONE gui=bold ctermfg=227 cterm=bold
highlight Comment guisp=NONE guifg=#7cbdd6 guibg=NONE gui=NONE ctermfg=74 cterm=NONE
highlight Character guisp=NONE guifg=#ffa0a0 guibg=NONE gui=NONE ctermfg=217 cterm=NONE
highlight Number guisp=NONE guifg=#8f8ffe guibg=NONE gui=bold ctermfg=204 cterm=bold
highlight Boolean guisp=NONE guifg=#ffa0a0 guibg=NONE gui=NONE ctermfg=217 cterm=NONE
highlight Operator guisp=NONE guifg=#d7d700 guibg=NONE gui=NONE ctermfg=184 cterm=NONE
highlight CursorLine guisp=#454545 guifg=NONE guibg=#202020 gui=NONE ctermbg=238 cterm=NONE
highlight Question guisp=NONE guifg=#50de50 guibg=NONE gui=bold ctermfg=77 cterm=bold
highlight WarningMsg guisp=NONE guifg=#fc9292 guibg=NONE gui=bold ctermfg=210 cterm=bold
highlight VisualNOS guisp=NONE guifg=NONE guibg=NONE gui=bold,underline cterm=bold,underline
highlight DiffDelete guisp=#e0ffff guifg=#0000ff guibg=#e0ffff gui=bold ctermfg=21 ctermbg=195 cterm=bold
highlight ModeMsg guisp=NONE guifg=#dbdbdb guibg=NONE gui=bold ctermfg=253 cterm=bold
highlight CursorColumn guisp=#454545 guifg=NONE guibg=#454545 gui=NONE ctermbg=238 cterm=NONE
highlight Define guisp=NONE guifg=#acace6 guibg=NONE gui=NONE ctermfg=147 cterm=NONE
highlight Function guisp=NONE guifg=#11a8ff guibg=NONE gui=NONE ctermfg=120 cterm=NONE
highlight FoldColumn guisp=#3d3d3d guifg=#87ceeb guibg=#3d3d3d gui=NONE ctermfg=117 ctermbg=238 cterm=NONE
highlight PreProc guisp=NONE guifg=#acace6 guibg=NONE gui=bold ctermfg=147 cterm=bold
highlight Visual guisp=#474747 guifg=NONE guibg=#474747 gui=NONE ctermbg=239 cterm=NONE
highlight MoreMsg guisp=NONE guifg=#2e8b57 guibg=NONE gui=bold ctermfg=29 cterm=bold
highlight VertSplit guisp=#4d4d4d guifg=#87ceeb guibg=#4d4d4d gui=NONE ctermfg=117 ctermbg=239 cterm=NONE
highlight Exception guisp=NONE guifg=#f5f55d guibg=NONE gui=bold ctermfg=227 cterm=bold
highlight Keyword guisp=NONE guifg=#deb887 guibg=NONE gui=bold ctermfg=180 cterm=bold
highlight Type guisp=NONE guifg=#a8e332 guibg=NONE gui=bold ctermfg=148 cterm=bold
highlight DiffChange guisp=#d600d6 guifg=NONE guibg=#d600d6 gui=NONE ctermbg=164 cterm=NONE
highlight Cursor guisp=#00ff00 guifg=#000000 guibg=#00ff00 gui=NONE ctermfg=16 ctermbg=46 cterm=NONE
highlight Error guisp=#fa2d2d guifg=#ffffff guibg=#fa2d2d gui=NONE ctermfg=231 ctermbg=196 cterm=NONE
highlight PMenu guisp=#404040 guifg=#eeeeee guibg=#404040 gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
highlight SpecialKey guisp=NONE guifg=#191919 guibg=NONE gui=NONE ctermfg=235 cterm=NONE
highlight Constant guisp=NONE guifg=#ffcfa0 guibg=NONE gui=NONE ctermfg=217 cterm=NONE
highlight Tag guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE ctermfg=214 cterm=NONE
highlight String guisp=NONE guifg=#ed8aa9 guibg=NONE gui=NONE ctermfg=211 cterm=NONE
highlight PMenuThumb guisp=#a8a8a8 guifg=#b2b2b2 guibg=#a8a8a8 gui=NONE ctermfg=249 ctermbg=248 cterm=NONE
highlight MatchParen guisp=#008b8b guifg=NONE guibg=#008b8b gui=NONE ctermbg=30 cterm=NONE
highlight Repeat guisp=NONE guifg=#f5f55d guibg=NONE gui=bold ctermfg=227 cterm=bold
highlight Directory guisp=NONE guifg=#c0c0fc guibg=NONE gui=NONE ctermfg=147 cterm=NONE
highlight Structure guisp=NONE guifg=#deb887 guibg=NONE gui=bold ctermfg=180 cterm=bold
highlight Macro guisp=NONE guifg=#d7d787 guibg=NONE gui=NONE ctermfg=186 cterm=NONE
highlight DiffAdd guisp=#2c72ab guifg=NONE guibg=#2c72ab gui=NONE ctermbg=25 cterm=NONE
highlight Conceal guisp=NONE guifg=#4d4d4d guibg=NONE gui=NONE ctermfg=239 cterm=NONE
highlight lCursor guifg=#000000 guibg=#00ffff guisp=#00ffff gui=NONE ctermfg=NONE ctermbg=14 cterm=NONE
highlight ColorColumn guisp=#9c4343 guifg=NONE guibg=#202020 gui=NONE ctermbg=131 cterm=NONE
highlight CursorLineNr guisp=NONE guifg=#90ee90 guibg=NONE gui=NONE ctermfg=120 cterm=NONE

highlight Tabline guisp=#4d4d4d guifg=#87cfeb guibg=#4d4d4d gui=NONE ctermfg=117 ctermbg=239 cterm=NONE
highlight TablineSel guisp=NONE guifg=#ed8aa9 guibg=NONE gui=NONE ctermfg=211 cterm=NONE
highlight TablineFill guisp=NONE guifg=#ed8aa9 guibg=NONE gui=NONE ctermfg=211 cterm=NONE

" These are needed to get the Language Server Protocol Highlights working.
highlight LspReferenceText guisp=#2e2e2e guifg=#9b9c9a guibg=#2e2e2e gui=NONE ctermfg=249 ctermbg=236 cterm=NONE
highlight LspReferenceRead  guisp=#2e2e2e guifg=#9b9c9a guibg=#2e2e2e gui=NONE ctermfg=249 ctermbg=236 cterm=NONE
highlight LspReferenceWrite guisp=#2e2e2e guifg=#9b9c9a guibg=#2e2e2e gui=NONE ctermfg=249 ctermbg=236 cterm=NONE

" }}}"
catch /^Vim\%((\a\+)\)\=:E185/
    " no plugins available
    colorscheme default
endtry
hi ColorColumn ctermbg=darkgrey guibg=black
" fix background color behaviour
hi Normal ctermbg=NONE

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

let g:terminal_color_4 = '#00aaff' " Get better directory listing

" }}}
