-- allow project-local config
vim.opt.exrc = true
-- restrict dangerous commands (no :!, no shell escapes)
vim.opt.secure = true

-- Re-source .nvim.lua when changing into a directory that contains one.
-- Needed when Neovide is launched as an app (CWD starts at ~, not the project).
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    local exrc = vim.fn.findfile(".nvim.lua", vim.fn.getcwd())
    if exrc ~= "" then
      vim.cmd("luafile " .. vim.fn.fnamemodify(exrc, ":p"))
    end
  end,
})

-- Old style config and keymaps to my liking
require("config.makeasync")
require("config.utils")
require("config.keymaps")
require("config.colorscheme")

--
-- Set up a user command to load the OpenAI API key
-- Key hard-coded to be in ~/.local/bin/keychatgpt.asc.gpg
--
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

---
-- Language server config
---
require("config.lsp")

-- 
-- Vim script files comes here ...
-- 
vim.cmd("source " .. vim.fn.stdpath("config") .. "/vim/ww-word-highlight.vim")
vim.cmd("source " .. vim.fn.stdpath("config") .. "/vim/abbreviations.vim")
vim.cmd("source " .. vim.fn.stdpath("config") .. "/luacommon/ww-ripgrep.lua")
