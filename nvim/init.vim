" Enter current millenia
" These one's are actually default in neovim and vim8
" set nocompatible
" filetype plugin indent on
" Enable syntax and plugins (for netrw) {{{
syntax enable                           " Enable syntax highlight
filetype plugin on                      " Filetype detection, plugin [ON]
" }}}

" Vimscript file settings ----------------- {{{
augroup filetype_vim
   autocmd!
   autocmd FileType vim setlocal foldmethod=marker
augroup END
" NOW we can use 'za' to fold and unfold the settings in the file.
" }}}

" ---- Define the leader {{{
let mapleader="\<space>"
let maplocalleader="\<space>"
" }}}

" Set up Vim to my liking --------------- {{{
set relativenumber                       " show the relative line number on the cursor line
set number                               " show line numbers
set numberwidth=5                        " allow x chars for number column
set nobackup                             " don't backup files, use git ..."
set noswapfile                           " avoid creating a swap file (after 200 chars?)"
set laststatus=2                         " last window always has a statusline
set nohlsearch                           " Don't continue to highlight searched phrases.
set incsearch                            " But do highlight as you type your search.
set ignorecase                           " Make searches case-insensitive.
set smartcase                            " Unless search uses capitals.
set ruler                                " Always show info along bottom.
set autoindent                           " auto-indent
set tabstop=3                            " tab spacing
set softtabstop=3                        " unify
set shiftwidth=3                         " indent/outdent by 3 columns
set shiftround                           " always indent/outdent to the nearest tabstop
set expandtab                            " use spaces instead of tabs
set smartindent
set backspace=indent,eol,start           " make backspace work like you'd expect in insert mode
set clipboard=unnamed                    " use system clipboard as default clipboard
set scrolloff=5                          " number of lines to keep above and below the cursor
set nowrap                               " don't wrap text
set autowriteall                         " write all files when hiding buffers
set guioptions-=m                        " remove menu bar
set guioptions-=T                        " remove toolbar
set guioptions-=r                        " remove right-hand scroll bar
set guioptions-=L                        " remove left-hand scroll bar
set updatetime=250                       " set the update time inside vim to be xms
set showbreak=↪
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ " toggle invisible characters
set list                                 " after the bread crumble; set the list
if (has('mac') && has("termguicolors"))  " enable 24 bit color support if supported
   set termguicolors
endif
" }}}

" F9 to toggle paste mode {{{
:nnoremap <silent><F9> :set paste!<CR>

" don't automatically comment next line on enter/o if already commenting
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" automatically strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" Execute the local working directory's .vimrc {{{
set exrc                                 " forces Vim to source .vimrc file if it present in working directory, thus providing a place to store project-specific configuration.
set secure                               " restrict usage of some commands in non-default .vimrc files; commands that write to file or execute shell commands are not allowed and map commands are displayed
" }}}

" Leader setup {{{
nnoremap <Leader>mm : make<CR>
nnoremap <Leader>fs : w<CR>
" print the unicode character (on the next line)
nnoremap <Leader>u mz"zylo<C-r>=printf('U+%04X', char2nr(@z))<CR><ESC>`z
" NOW WE CAN:
" - Take over the world
" Set up the build system
" }}}

" Set up the make system {{{
set makeprg=$HOME/Development/build.sh
" NOW WE CAN:
" Run :make to build
" - use :cl to list errors
" - use :cc# to jump to error number
" - use :cn and cp to navigate forward and back
" }}}

" Normal mode mappings" {{{
" My mappings - comments are not so easy for mappings
" ==============================================================================
" Add " around words.
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" Add " around words.
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" Move a line downwards
nnoremap - ddp
" Move a line upwards
nnoremap _ kddpk
" Uppercase word from insert mode
inoremap <c-u> <esc>viwUea
" Uppercase word from normal mode
nnoremap <c-u> viwUel
" Remap the ; key to the : to simplify use of commands, and wise versa.
nnoremap : ;
nnoremap ; :
" List buffers (using fzf)
nnoremap <leader>bb :Buffers<CR>
" Mappings for NerdTree.
nnoremap <leader><tab> :NERDTreeToggle<cr>
"As an alternative to :echo getline(search('\v^[[:alpha:]$_]', "bn", 1, 100))<CR>
nnoremap <C-g> :Lost<CR>
" ==================  make sarches always appear in centre of page
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz
" clear search highlighting with enter
nnoremap <cr> :noh<CR><CR>:<backspace>
" }}}

" Insert mode mappings {{{
" ==============================================================================
inoremap jk <esc>
" Disable the <esc> key in insert mode for now ..."
"inoremap <esc> <nop>
" }}}

" Theme setup {{{
"colo dracula
"colo kalisi
colo termschool
set background=dark
hi ColorColumn ctermbg=darkgrey guibg=lightgrey
" fix background color behaviour
hi Normal ctermbg=NONE

" in case t_Co alone doesn't work, add this as well:
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Source\ Code\ Pro\ 16                        " Tested on xfe ubuntu 14.04"
  elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro:h13                        " Tested on macvim
  elseif has("gui_photon")
    set guifont=Source\ Code\ Pro:h33
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0            " Not tested."
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-* " Not tested "
  else
    set guifont=Courier_New:h11:cDEFAULT                     " Not tested "
  endif
endif
" }}}

" Highlight ColorColumn ----------------- {{{
highlight ColorColumn ctermbg=darkgrey" set up color coding, most likely overridden by colorscheme
set colorcolumn=101                      " highligth when going over N columns.
" set listchars=tab:>~,nbsp:_,trail:.      " bread crumble the spaces and tabs
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list                                 " after the bread crumble; set the list
" }}}

" Set up the silver searcher when using Ack {{{
let g:ackprg = "ag --vimgrep"
" }}}

" Make it easier to make it easier to edit the .vimrc {{{
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>se :source $MYVIMRC<CR>
" }}}

" Search down into subfolders {{{
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
"
" THINGS TO CONSIDER
"
" - :b lets you autocomplete any open buffer
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

" Linter setup (ale) {{{
let g:ale_linters = {'cpp': ['clangcheck'],}
let g:ale_sign_column_always = 1
let g:ale_cpp_clang_options = '-std=c++11 -Wall'
let g:ale_completion_enabled = 1
"
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tagbar#flags = 'f' " Show function names
" }}}

"Folding of code {{{
" Now we can fold code by
" 1: mark the beginning of a scope with mb
" 2: move to the end of the scope with the % sign
" 3: create a fold by typing zf'b
" The folded code should be persistent.
autocmd BufWinLeave *.* mkview " restor the foldinging view of files.
autocmd BufWinEnter *.* silent loadview
" }}}

" Automatic generation of help files {{{
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" }}}

" Rust programming language setup {{{
augroup MyRustProgGroup
   autocmd!
   let g:rustfmt_autosave = 1
    autocmd FileType rs nnoremap <buffer><Leader>cf :<C-u>RustFmt<CR>
    autocmd FileType rs vnoremap <buffer><Leader>cf :RustFmt<CR>
augroup END
" }}}

" Set up the persistent undo. {{{
" There should be files under ~/.local/share/nvim/undo
set undofile
if !has('nvim')
   set undodir=~/.local/share/nvim/undo
endif
augroup vimrc
   autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
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
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
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

" Use ripgrep with the :Find command {{{
" --column: Show column number
"  " --line-number: Show line number
"  " --no-heading: Do not show file headings in results
"  " --fixed-strings: Search term as a literal string
"  " --ignore-case: Case insensitive search
"  " --no-ignore: Do not respect .gitignore, etc...
"  " --hidden: Search hidden files and folders
"  " --follow: Follow symlinks
"  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
"  " --color: Search color options
"
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
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

" My own status line setup {{{
" Now I can take full control of my status line.
" The tutorial can be found at
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
set laststatus=2

" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
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
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
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
  "let statusline.="%f"                   " Specify path and file.
  let statusline.="%t"                    " Specify only filename.
  let statusline.="%{&modified?'\ \ ☠\ ':MySavedTime()}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="\ "
  let statusline.="\ %{LinterStatus()}"
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
  let statusline.="%f"                   " Specify path and file.
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

" Use git to backup everything that I edit {{{
" https://www.reddit.com/r/vim/comments/8w3udw/topnotch_vim_file_backup_history_with_no_plugins/
" That's it! All your files (even those that are not in any version control) are now
" reliably backed up to ~/.vim_custom_backups whenever you save. I have been using this
" for years and it has worked wonders.
 augroup custom_backup
    autocmd!
    autocmd BufWritePost * call BackupCurrentFile()
  augroup end

 let s:custom_backup_dir='~/.vim_custom_backups'
 function! BackupCurrentFile()
   if !isdirectory(expand(s:custom_backup_dir))
     let cmd = 'mkdir -p ' . s:custom_backup_dir . ';'
     let cmd .= 'cd ' . s:custom_backup_dir . ';'
     let cmd .= 'git init;'
     call system(cmd)
   endif
   let file = expand('%:p')
   if file =~ fnamemodify(s:custom_backup_dir, ':t') | return | endif
   let file_dir = s:custom_backup_dir . expand('%:p:h')
   let backup_file = s:custom_backup_dir . file
   let cmd = ''
   if !isdirectory(expand(file_dir))
     let cmd .= 'mkdir -p ' . file_dir . ';'
   endif
   let cmd .= 'cp ' . file . ' ' . backup_file . ';'
   let cmd .= 'cd ' . s:custom_backup_dir . ';'
   let cmd .= 'git add ' . backup_file . ';'
   let cmd .= 'git commit -m "Backup - `date`";'
   call jobstart(cmd)
 endfunction

 noremap <silent> <leader>obk :call OpenCurrentFileBackupHistory()<cr>

" Bonus: if you use tmux, here's a little helper function to open the backup history for
" the current file by pressing <leader>obk (as in "open backup"):
function! OpenCurrentFileBackupHistory()
  let backup_dir = expand(s:custom_backup_dir . expand('%:p:h'))
  let cmd = 'tmux split-window -h -c "' . backup_dir . '"\; '
  let cmd .= 'send-keys "git log --patch --since=\"1 month ago\" ' . expand('%:t') . '" C-m'
  call system(cmd)
endfunction

" }}}
