local present, navbuddy = pcall(require, "nvim-navbuddy")

if not present then
  return
end

local presentactions, actions = require("nvim-navbuddy.actions")

if not presentactions then
  print("nvim-navbuddy.actions is not present")
  return
end

local presentnavic, navic = require("nvim-navic")
if not presentnavic then
  print("nvim-navic is not present")
  return
end

print("nvim-navbuddy.actions is present")

-- local b = navbuddy.builtins

navbuddy.setup({})

-- navic.setup({})
