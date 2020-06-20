
"{{{ Abbreviations
" Get the time {{{
function! MyGetTime()
    let s = strftime("%Y %b %d")
    return s
endfunc
" }}}

" To consume the space typed after an abbreviation: >
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

" Return file name
function! MyFileName()
    let d = expand('%:t')
    return d
endfunc

" Return a commment line {{{
let g:commentstars = '******************************************************************************'
let g:commentcc = '/// ---'
let g:commentline = '//------------------------------------------------------------------------------'
function! MyStartCC()
    let c = g:commentcc
    return c
endfunc

function! MyStartC()
    let c = '/'.g:commentstars
    return c
endfunc

function! MyEndC()
    let c = g:commentstars.'/'
    return c
endfunc

function! MySepLineC()
  let c = g:commentline
  return c
endfunc
" }}}

"Take a look at the insert mode remappings instead for this one.
"iabbrev <silent> { <C-R>=Eatchar('\s')<CR>{<CR><CR>}<Up>
iabbrev <silent> note NOTE:
iabbrev <silent> todo TODO: (Willy Clarke)
iabbrev <silent> fixme FIXME: (Willy Clarke)
iabbrev <silent> bugf BUGFIX:
iabbrev <silent> enha ENHANCEMENT:
iabbrev <silent> w@ willy@clarke.no
iabbrev <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
iabbrev <silent> while while ()<Left><C-R>=Eatchar('\s')<CR>
iabbrev <silent> fidx for (size_t Idx = 0; ///<!<CR>Idx <; ///<!<CR> ++Idx)<CR>{<CR><Up><Up><Up><Esc>f;i
iabbrev <silent> faut for (auto E : )<CR>{<CR><Up><Up><Esc>f:a
iabbrev <silent> fitr for (auto it = MyContainer.cbegin();  //!<<CR>it != MyContainer.cend();//!<<CR> ++it)<CR>{<CR><Up><Up><Up><Esc>fMciw
iabbrev <silent> loginfo LOGINFO("{} -> {}", __FUNCTION__, "A text");
iabbrev <silent> logerr LOGERROR("{} -> {}", __FUNCTION__, "A text");
iabbrev <silent> sendl std::endl
iabbrev <silent> ;; << std::endl;<CR>
iabbrev <silent> scout std::cout <<
iabbrev <silent> scerr std::cerr <<
"    " For myheader : Go to column 0, then enter insert mode, then enter the rest
"    " of the stuff.
"autocmd FileType c, cpp, objc :iabbrev <silent> myheader <Esc>0i<C-R>=MyStartC()<CR><CR>* Filename : <C-R>=MyFileName()<CR><CR>* Date     : <C-R>=MyGetTime()<CR><CR>* Author   : Willy Clarke (willy@clarke.no)<CR>* Version  : 0.0.1<CR>* Copyright: W. Clarke<CR>* License  : MIT<CR>* Descripti:<CR><C-R>=MyEndC()<CR><Left><C-R>=Eatchar('\s')<CR><Up><Up><Esc>$a
iabbrev <silent> myheader <Esc>0i<C-R>=MyStartC()<CR><CR>* Filename : <C-R>=MyFileName()<CR><CR>* Date     : <C-R>=MyGetTime()<CR><CR>* Author   : Willy Clarke (willy@clarke.no)<CR>* Version  : 0.0.1<CR>* Copyright: W. Clarke<CR>* License  : MIT<CR>* Descripti:<CR><C-R>=MyEndC()<CR><Left><C-R>=Eatchar('\s')<CR><Up><Up><Esc>$a
iabbrev <silent> mycom <C-R>=MyStartC()<CR><CR><left>* NOTE: <CR><left><C-R>=MyEndC()<CR><Up><Esc>$i
iabbrev <silent> myccom <C-R>=MyStartCC()<CR><CR>// NOTE: <CR><C-R>=MyStartCC()<CR><Up><Esc>$i
"    " Progamming an project related abbreviations. Consider moving these to a
"    " project .nvimrc
iabbrev <silent> ecpnon ECPRINTNONE <<
iabbrev <silent> ecperr ECPRINTERROR <<
iabbrev <silent> ecpcur ECPRINTNONE << EcCurrentFunction << " -> "  << __FILE__ << ":" << __LINE__ << std::endl;<Esc>0f>a
iabbrev <silent> ret return ();<left><left><C-R>=Eatchar('\s')<CR>
iabbrev <silent> //- <C-R>=MySepLineC()<CR><CR><C-R>=Eatchar('\s')<CR>
" Misspelled words ...
iabbrev <silent> teh the
"}}}

