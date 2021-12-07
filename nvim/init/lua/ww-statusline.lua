-- statusline.lua
local mode_map = {
  ['n'] = 'N ',
  ['no'] = 'n·operator pending ',
  ['v'] = 'V ',
  ['V'] = 'V·line ',
  [''] = 'V·block ',
  ['s'] = 'Select ',
  ['S'] = 'S·line ',
  [''] = 'S·block ',
  ['i'] = 'I ',
  ['R'] = 'R ',
  ['Rv'] = 'V·replace ',
  ['c'] = 'Command ',
  ['cv'] = 'Vim ex ',
  ['ce'] = 'Ex ',
  ['r'] = 'Prompt ',
  ['rm'] = 'More ',
  ['r?'] = 'Confirm ',
  ['!'] = 'Shell ',
  ['t'] = 'Terminal '
}

local function mode()
  local m = vim.api.nvim_get_mode().mode
  if mode_map[m] == nil then return m end
  return mode_map[m]
end

vim.api.nvim_exec(
  [[
  hi PrimaryBlock   ctermfg=06 ctermbg=00
  hi SecondaryBlock ctermfg=08 ctermbg=00
  hi Blanks   ctermfg=07 ctermbg=00
  ]], false)

local function CodeFunction()
  -- return nvim_treesitter().statusline
  local str = nvim_treesitter#statusline()
  return 'Hi'
end

local function GitBranch()
  return vim.cmd.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
end

local stl = {
  '%#PrimaryBlock#',
  CodeFunction(),
  '%#SecondaryBlock#',
  '%#Blanks#',
  '%f',
  '%m',
  '%=',
  '%#SecondaryBlock#',
  '%l,%c ',
  '%#PrimaryBlock#',
  '%{&filetype}',
}

vim.o.statusline = table.concat(stl)

