---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-j>"] = { "ddp", "move line down", opts = { nowait = true } },
    ["<C-k>"] = { "ddkP", "move line up", opts = { nowait = true } },
  },
}

-- more keybinds!
-- Your custom mappings
M.abc = {
  n = {
    ["<C-n>"] = {"<cmd> Telescope <CR>", "Telescope"},
    ["<C-s>"] = {":Telescope find_files <CR>", "Telescope find files"},
    ["<leader>0"] = {":nohlsearch <CR>", "Turn off highlight"},
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    -- ...
  },
}

return M
