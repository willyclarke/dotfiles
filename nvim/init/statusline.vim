
" My own status line setup {{{
" Now I can take full control of my status line.
" The tutorial can be found at
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
set laststatus=2

" Function: display errors from Ale in statusline
function! LinterStatus() abort
   return ''
   "let l:counts = ale#statusline#Count(bufnr(''))
   "let l:all_errors = l:counts.error + l:counts.style_error
   "let l:all_non_errors = l:counts.total - l:all_errors
   "return l:counts.total == 0 ? '' : printf(
   "\ 'W:%d E:%d',
   "\ l:all_non_errors,
   "\ l:all_errors
   "\)
endfunction

" Function: return the time of some file
function! MySavedTime() abort
   if exists("*strftime")
      let l:mysavetime = getftime(expand('%'))
      let l:myconvsavetime = strftime('%T', l:mysavetime)
      return printf(' ⁅ ↯%s ⁆', l:myconvsavetime)
   endif
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
  endif
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! CodeFunction()
  return nvim_treesitter#statusline(90)
endfunction

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
endfunction

" This code has been copied from
" https://www.reddit.com/r/vim/comments/6b7b08/my_custom_statusline/?st=jc4oipo5&sh=d41a21b1
function! ActiveStatus()
  let statusline=""
  let statusline.="%1*"
  let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
  let statusline.="%2*"
  let statusline.=""
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%3*"
  let statusline.=""
  let statusline.="%4*"
  let statusline.="\ %<"
  let statusline.="%F"                   " Specify path and file.
  "let statusline.="%t"                    " Specify only filename.
  let statusline.="%{&modified?'\ \ ☠\ ':MySavedTime()}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="\ "
  let statusline.="\ %{LinterStatus()}"
  let statusline.="\ %{CodeFunction()}"
  let statusline.="\ "
  let statusline.="%="                    " Go rigth
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="%3*"
  let statusline.="\ "
  let statusline.="%2*"
  let statusline.=""
  let statusline.="%1*"
  let statusline.="\ %2v"
  let statusline.="\ %3p%%\ "
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
  let statusline.="\ %<"
  let statusline.="%F"                   " Specify path and file.
  "let statusline.="%t"                    " Specify only filename.
  let statusline.="%{&modified?'\ \ ☠\ ':''}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="\ \ "
  let statusline.="\ %2v"
  let statusline.="\ %3p%%\ "
  return statusline
endfunction

set laststatus=2
set statusline=%!ActiveStatus()
hi User1 guibg=#afd700 guifg=#005f00
hi User2 guibg=#005f00 guifg=#afd700
hi User3 guibg=#222222 guifg=#005f00
hi User4 guibg=#222222 guifg=#d0d0d0

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
  autocmd ColorScheme termschool if(&background=="dark") | hi User1 guibg=#afd700 guifg=#005f00 | endif
  autocmd ColorScheme termschool if(&background=="dark") | hi User2 guibg=#005f00 guifg=#afd700 | endif
  autocmd ColorScheme termschool if(&background=="dark") | hi User3 guibg=#222222 guifg=#005f00 | endif
  autocmd ColorScheme termschool if(&background=="dark") | hi User4 guibg=#222222 guifg=#d0d0d0 | endif
  autocmd ColorScheme termschool if(&background=="light") | hi User1 guibg=#afd700 guifg=#005f00 | endif
  autocmd ColorScheme termschool if(&background=="light") | hi User2 guibg=#005f00 guifg=#afd700 | endif
  autocmd ColorScheme termschool if(&background=="light") | hi User3 guibg=#707070 guifg=#005f00 | endif
  autocmd ColorScheme termschool if(&background=="light") | hi User4 guibg=#707070 guifg=#d0d0d0 | endif
augroup END

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}
" }}}

