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
    ["<leader>b"] = {":Telescope buffers <CR>", "Telescope buffers"},
    ["<leader>gj"] = {":Gitsigns next_hunk<CR>", "next hunk"},
    ["<leader>gk"] = {":Gitsigns prev_hunk<CR>", "prev hunk"},
    ["<leader>gp"] = {":Gitsigns preview_hunk<CR>", "preview hunk"},
    ["<leader>gn"] = {":Neogit <CR>", "Neogit"},
    ["<leader>gr"] = {":Gitsigns reset_hunk<CR>", "reset hunk"},
    ["<leader>gs"] = {":Gitsigns stage_hunk<CR>", "stage hunk"},
    ["<leader>mm"] = { ":make<CR>", "run the make", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    -- ...
  },
}

return M
