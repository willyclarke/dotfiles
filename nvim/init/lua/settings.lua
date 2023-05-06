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
