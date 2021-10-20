" set the runtime path to include Vundle and initialize {{{
set rtp+=~/.config/nvim/pack/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-scripts/vimagit'

"Plugin 'gregsexton/gitv'
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'

Plugin 'https://github.com/nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}
Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/completion-nvim'
Plugin 'nvim-lua/lsp-status.nvim'
Plugin 'nvim-lua/diagnostic-nvim'
""Plugin 'hrsh7th/nvim-compe'

if g:os == "Darwin"
  Plugin 'https://github.com/rizzatti/dash.vim.git'
endif

function! GetNVimVersion()
    redir => s
    silent! version
    redir END
    return matchstr(s, 'NVIM v\zs[^\n]*')
endfunction

"source  ~/.nvim_runtime/plugintelescope.vim

"}}}

" Notes {{{
"Plugin 'https://github.com/xolox/vim-misc.git'
"Plugin 'https://github.com/xolox/vim-notes.git'
"let g:notes_directories = ['~/Development/VimNotes/user']

" Using the notes file type for git commit messages
" If you write your git commit messages in Vim and want to use the
" notes file type (syntax highlighting and editing mode) to edit
" your git commit messages you can add the following line to your [vimrc script] vimrc:
autocmd BufNewFile,BufRead */.git/COMMIT_EDITMSG setlocal filetype=notes
" }}} " Notes fold ends here

" All of your Plugins must be added before the following line {{{
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" }}} " Vundle plugin loading fold ends here

" Automatic generation of help files {{{
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" }}}
