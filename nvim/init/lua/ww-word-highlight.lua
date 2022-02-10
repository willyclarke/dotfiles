local cmd = vim.cmd
local Utils = require("utils")

-- Highlight Word {{{
-- NOTE:
-- This code has been pasted from
-- https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc?fileviewer=file-view-default
--
-- This mini-plugin provides a few mappings for highlighting words temporarily.
--
-- Sometimes you're looking at a hairy piece of code and would like a certain
-- word or two to stand out temporarily.  You can search for it, but that only
-- gives you one color of highlighting.  Now you can use <leader>N where N is
-- a number from 1-6 to highlight the current word in a specific color.
-- }}}
--
function HiInterestingWord(n)
  -- Save our location
  vim.cmd([[normal! mz]]) -- into mark z

  -- Yank the current word into the z register
  vim.cmd([[normal! "zyiw]])

  -- Calculate an arbitrary match ID.  Hopefully nothing else is using it.
  local mid = 86750 + n

  -- Clear existing matches, but don't worry if they don't exist'.
--  matchdelete(mid)

  print('Got a match')
end

HiInterestingWord(1)
