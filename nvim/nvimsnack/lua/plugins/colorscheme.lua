return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        treesitter = true,
        gitsigns = true,
        lsp_trouble = true,
        telescope = true,
        notify = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
