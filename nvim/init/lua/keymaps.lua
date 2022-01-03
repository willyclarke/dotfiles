local Utils = require("utils")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

--Remap space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--
-- NORMAL MODE REMAPPINGS --
--
--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Move a line downwards
nnoremap('-', 'ddp')
nnoremap('<C-j>', ':m .+1<CR>==')
--" Move a line upwards
nnoremap("_", "kddpk")
nnoremap('<C-k>', ':m .-2<CR>==')

-- Swap ; with :
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = false})
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = false})

-- Remap the C-g which normally shows info about the file to show info about
-- the current method.
nnoremap('<C-g>', ':echo getline(search(\'\v^[[:alpha:]$_]\', \"bn\", 1, 100))<CR>')

-- ==================  make sarches always appear in centre of page
nnoremap('n', 'nzz')
nnoremap('N', 'Nzz')
nnoremap('*', '*zz')
nnoremap('#', '#zz')
nnoremap('g*','g*zz')
nnoremap('g#','g#zz')
-- clear search highlighting with enter
nnoremap('<cr>', ':noh<CR><CR>:<backspace>')

nnoremap("<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])

-- Make it easier to edit the init.lua file
-- nnoremap("<leader>se", ":luafile $MYVIMRC<CR>")
-- nnoremap("<leader>ve", ":vsplit $MYVIMRC<CR>")

-- Save my buffer
-- nnoremap("<leader>fs", ":w<CR>")

-- From Steve Losh youtube walkthrough : Close all other folds but the one I am
-- on at the moment.
-- nnoremap('<leader>z', 'zMzvzz')
nnoremap('<tab>', '%')

-- Copy current absolute filename into register
-- nnoremap('<leader>fn', ':let @*=expand(\'%:p\')<CR>')
-- Yank file of which filename was already copied into register.
-- nnoremap('<leader>yf', ':%y+<cr>')

-- nnoremap("<leader>gg", [[<cmd>Neogit<CR>]])
nnoremap("<leader>mm", [[<cmd>make<CR>]])
-- May add support for these later, since they look interresting ...
-- nnoremap("<leader>e", [[<cmd>NvimTreeToggle<CR>]])
-- nnoremap("<leader>s", [[<cmd>SymbolsOutline<CR>]])
-- nnoremap("<leader>t", ':vertical split<CR><C-w>l :terminal<CR>i')

--
-- INSERT MODE REMAPPINGS --
--

inoremap('jk', '<esc>')
-- Disable the <esc> key in insert mode for now ..."
-- inoremap <esc> <nop>
-- DIY autoclosing
-- inoremap('(;', '();<left><left>')
-- inoremap('[;', '[];<left><left>')
-- inoremap('(', '()<left>')
-- inoremap('[', '[]<left>')
-- inoremap('{<cr>', '{<cr>}<esc>O')
-- inoremap('(<cr>', '(<cr>)<esc>O')
-- inoremap('[<cr>', '[<cr>]<esc>O')
-- inoremap('"', '""<left>')
-- inoremap('\'', '\'\'<left>')
-- inoremap('`', '``<left>')
-- inoremap('```', '```<cr>```<esc>O')
-- Jump over the doubled up chars above you can use Ctrl-l
inoremap('<c-l>', '<right>')
-- Move a line downwards
inoremap('<C-j>', '<Esc>:m .+1<CR>==gi')
-- inoremap('<tab>', '%' )
-- Move a line upwards in insert mode
-- inoremap('<C-k>', '<Esc>:m .-2<CR>==gi') -- This one disables vim's ability to do digraphs.

--
-- VISUAL MODE MAPPINGS {{{
--
vnoremap('<tab>', '%')
-- Move a line downwards
vnoremap('<C-j>', ':m \'>+1<CR>==gv')
-- Move a line upwards
vnoremap('<C-k>', ':m \'<-2<CR>==gv')
-- }}}
