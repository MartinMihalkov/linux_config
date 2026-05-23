return {
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      lsp = {
        auto_attach = true, -- Automatically attach to LSP servers
      },
      highlight = true,
      separator = " > ",
    },
  },
}
