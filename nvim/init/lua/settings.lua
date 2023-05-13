local cmd = vim.cmd
local u = require('utils')

vim.api.nvim_exec(
  [[
  augroup remove_trailing_whitespace
  autocmd!
  autocmd BufWritePre * :lua preserve('%s/\\s\\+$//ge')
  augroup end
  ]],
  false
)

vim.api.nvim_exec(
  [[
  augroup backup_current_file_with_git
  autocmd!
  autocmd BufWritePre * :lua backupcurrentfile()
  augroup end
  ]],
  false
)

-- Move line up and down
vim.api.nvim_set_keymap('n', '<C-k>', 'ddkP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', 'ddp', { noremap = true, silent = true })

-- Insert mode motions
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })

-- Visual mode motions
-- vnoremap <tab> %
vim.api.nvim_set_keymap('v', '<TAB>', '%', { noremap = true })
-- Move a line upwards
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>==gv", { noremap = true })
-- Move a line downwards
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>==gv", { noremap = true })
