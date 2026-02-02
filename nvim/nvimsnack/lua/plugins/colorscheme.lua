return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        treesitter = false,
        gitsigns = true,
        lsp_trouble = true,
        telescope = false,
        notify = true,
        snacks = {
            enabled = true,
            indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
