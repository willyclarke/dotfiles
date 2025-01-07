-- Old style config and keymaps to my liking
require("config.utils")
require("config.keymaps")
--
-- Set up a user command to load the OpenAI API key
-- Key hard-coded to be in ~/.local/bin/keychatgpt.asc.gpg
--
require("config.chatgptkey")

-- Load the lazy plugin manager.
-- the tree structure that follows is supported:
-- ./init.lua
-- |
-- +--lua/config
-- +--lua/plugins
-- +--vim/
--
require("config.lazy")

-- 
-- Call options here in case some plugins override my options.
-- 
require("config.options")

-- 
-- Vim script files comes here ...
-- 
vim.cmd("source " .. vim.fn.stdpath("config") .. "/vim/ww-word-highlight.vim")
vim.cmd("source " .. vim.fn.stdpath("config") .. "/vim/abbreviations.vim")
