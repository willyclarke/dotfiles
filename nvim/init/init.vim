" Top file for initialization of neovim
" This file is used to source the other files.
" @author: 'Willy Clarke'

set runtimepath+=.nvim_runtime

" Try to detect the os that we are on ... {{{
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
" }}} os dectection fold

" A link in the users home directory is needed to point to the nvim init files"
source ~/.nvim_runtime/plugins.vim

source ~/.nvim_runtime/leader.vim
source ~/.nvim_runtime/abbreviations.vim
source ~/.nvim_runtime/bufferautocomands.vim
source ~/.nvim_runtime/myliking.vim
source ~/.nvim_runtime/colorscheme.vim
source ~/.nvim_runtime/display.vim
source ~/.nvim_runtime/mapmodecommands.vim
source ~/.nvim_runtime/mapmodeins.vim
source ~/.nvim_runtime/mapmodenorm.vim
source ~/.nvim_runtime/mapmodevis.vim
source ~/.nvim_runtime/statusline.vim
source ~/.nvim_runtime/buildsetup.vim
source ~/.nvim_runtime/completion.vim
source ~/.nvim_runtime/linting.vim
