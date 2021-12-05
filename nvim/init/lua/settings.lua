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

