
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

" Set up Vim to my liking --------------- {{{
set relativenumber                       " show the relative line number on the cursor line
set number                               " show line numbers
set numberwidth=5                        " allow x chars for number column
augroup toggle_relative_number           " Enable relative numbers in normal mode
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END
set nobackup                             " don't backup files, use git ..."
set noswapfile                           " avoid creating a swap file (after 200 chars?)"
set laststatus=2                         " last window always has a statusline
set nohlsearch                           " Don't continue to highlight searched phrases.
set incsearch                            " But do highlight as you type your search.
set ignorecase                           " Make searches case-insensitive.
set smartcase                            " Unless search uses capitals.
set ruler                                " Always show info along bottom.
set autoindent                           " auto-indent
set autowrite                            " write buffer (when doing make ..
set autoread                             " automatically re-read a file when changed on disk
set tabstop=2                            " tab spacing
set softtabstop=2                        " unify
set shiftwidth=2                         " indent/outdent by n columns
set shiftround                           " always indent/outdent to the nearest tabstop
set expandtab                            " use spaces instead of tabs
set smartindent
set backspace=indent,eol,start           " make backspace work like you'd expect in insert mode
set clipboard=unnamed                    " use system clipboard as default clipboard
set scrolloff=5                          " number of lines to keep above and below the cursor
set nowrap                               " don't wrap text
set autowriteall                         " write all files when hiding buffers. NOTE: causes uncoditional writes
set guioptions-=m                        " remove menu bar
set guioptions-=T                        " remove toolbar
set guioptions-=r                        " remove right-hand scroll bar
set guioptions-=L                        " remove left-hand scroll bar
set updatetime=250                       " set the update time inside vim to be xms
set showbreak=↪
set showmode                             " show the mode on the last line
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ " toggle invisible characters
set list                                 " after the bread crumble; set the list
if (has("termguicolors"))                " enable 24 bit color support if supported
   set termguicolors
endif
" }}}

" Execute the local working directory's .vimrc {{{
set exrc                                 " forces Vim to source .vimrc file if it present in working directory, thus providing a place to store project-specific configuration.
set secure                               " restrict usage of some commands in non-default .vimrc files; commands that write to file or execute shell commands are not allowed and map commands are displayed
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

" Set up the silver searcher when using Ack {{{
let g:ackprg = "ag --vimgrep"
" }}}

" Runtime path {{{
" If installed using git
set runtimepath+=~/.fzf
"}}}

" Load CtrlP much faster {{{
"
" Most of the time we can skip a few places like: generated files,
" Vim swap files, vendor directories and so on.
" But… if you are using git — and please say you are — 
" then I bet you already have this list inside .gitignore!
" So here is the secret: Make CtrlP load 100x faster by making it skip files
" inside .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
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

