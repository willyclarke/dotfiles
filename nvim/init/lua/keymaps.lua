local Utils = require("utils")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Swap ; with :
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = false})
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = false})

nnoremap("<C-r>", ":luafile %<CR>")
nnoremap("<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
nnoremap("<leader>se", ":luafile %<CR>")
nnoremap("<leader>fs", ":w<CR>")
nnoremap("<leader>e", [[<cmd>NvimTreeToggle<CR>]])
nnoremap("<leader>g", [[<cmd>Neogit<CR>]])
nnoremap("<leader>s", [[<cmd>SymbolsOutline<CR>]])
