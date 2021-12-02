local Utils = require("utils")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Add " around words. FIXME: I really wanted this to use the ''' symbol
nnoremap('<leader>1', 'viw<esc>a\"<esc>hbi\"<esc>lel')
-- Add ' around words' FIXME: I really wanted this to use the '"' symbol.
nnoremap('<leader>2', 'viw<esc>a\'<esc>hbi\'<esc>lel')
-- Move a line downwards
nnoremap("-", "ddp")
nnoremap("<C-j>", ":m .+1<CR>==")
--" Move a line upwards
nnoremap("_", "kddpk")
nnoremap("<C-k>", ":m .-2<CR>==")

-- Swap ; with :
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = false})
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = false})

nnoremap("<C-r>", ":luafile %<CR>")
nnoremap("<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
nnoremap("<leader>se", ":luafile ~/.config/nvim/init.lua<CR>")
nnoremap("<leader>ve", ":e ~/.config/nvim/init.lua<CR>")
nnoremap("<leader>fs", ":w<CR>")
nnoremap("<leader>e", [[<cmd>NvimTreeToggle<CR>]])
nnoremap("<leader>gg", [[<cmd>Neogit<CR>]])
nnoremap("<leader>s", [[<cmd>SymbolsOutline<CR>]])
