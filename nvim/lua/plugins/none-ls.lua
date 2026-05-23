return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      -- 1. Register your tools
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- ESLint_d (the faster version)
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.formatting.eslint_d,

        -- Rubocop with pending cops enabled
        null_ls.builtins.diagnostics.rubocop.with({
          extra_args = { "--enable-pending-cops" },
        }),
        null_ls.builtins.formatting.rubocop.with({
          extra_args = { "--enable-pending-cops" },
        }),
      },

      -- In your none-ls.lua sources list:
      -- 2. This MUST be inside setup to work
    })

    -- Manual format keymap
    -- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Buffer" })
    -- -- Format only the visual selection
    -- vim.keymap.set("v", "<leader>gf", function()
    --   vim.lsp.buf.format({ range = true })
    -- end, { desc = "Format Selection" })
    -- One shortcut to rule them all:
    -- In Normal mode: Formats the whole file
    -- In Visual mode: Formats only the selection
    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      vim.lsp.buf.format()
    end, { desc = "LSP Format (Selection or Buffer)" })
  end,
}
