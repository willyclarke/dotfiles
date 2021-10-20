" Top file for initialization of neovim
" This file is used to source the other files.
" @author: 'Willy Clarke'

" A link in the users home directory is needed to point to the nvim init files"
" The dotfiles directory for neovim need to be pointed to by .nvim_runtime
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

source ~/.nvim_runtime/leader.vim " Leader may be used in the plugins.vim so it is loaded first.

source ~/.nvim_runtime/plugins.vim
""source ~/.nvim_runtime/pluginstresitter.vim " alternate small plugin file. Do not do both. For debugging ..."

source ~/.nvim_runtime/abbreviations.vim
source ~/.nvim_runtime/bufferautocomands.vim
source ~/.nvim_runtime/myliking.vim
source ~/.nvim_runtime/colorscheme.vim
source ~/.nvim_runtime/display.vim
source ~/.nvim_runtime/wordhighlight.vim
source ~/.nvim_runtime/mapmodecommands.vim
source ~/.nvim_runtime/mapmodeins.vim
source ~/.nvim_runtime/mapmodenorm.vim
source ~/.nvim_runtime/mapmodevis.vim
source ~/.nvim_runtime/statusline.vim
""source ~/.nvim_runtime/buildsetup.vim
""source ~/.nvim_runtime/completion.vim
source ~/.nvim_runtime/completionrefact.vim
source ~/.nvim_runtime/linting.vim

