"
" NOTE: This file need to be included as part of the plugin settings
" when using vundle since the plugin loading happens here
" ---
" File browsing plugin - needs neovim 0.5 or later
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-fzy-native.nvim'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Telescope file manager plugin settings
"
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"Lists git commits with diff preview and on enter checkout the commit.
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>

"Lists buffer's git commits with diff preview and checkouts it out on enter.
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_bcommits()<cr>

"Lists current changes per file with diff preview and add action. (Multiselection still WIP)
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>

