local present, navic = pcall(require, "nvim-navic")

if not present then
  return
end

if not present then
  print("nvim-navic is not present")
  return
end

print("nvim-navic is present")

-- local b = navic.builtins

navic.setup({
  print("Doing navic setup ..."),
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "練",
    Interface = "練",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "◩ ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
  lsp = {
    auto_attach = true,
    preference = { "clangd", "pyright" },
  },
  highlight = true,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  click = false,
})
