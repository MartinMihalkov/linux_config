return {
  "neovim/nvim-lspconfig",
  -- This "dependencies" block is key.
  -- It forces Lazy to load cmp and the bridge BEFORE starting lspconfig.
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Also add borders to diagnostic floats (the error popups)
    vim.diagnostic.config({
      float = { border = _border },
    })

    -- We use pcall (protected call) to prevent the error if cmp is still missing
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if not has_cmp then
      print("LSP Bridge: cmp-nvim-lsp not found yet")
      return
    end

    local capabilities = cmp_lsp.default_capabilities()
    -- Apply capabilities globally
    -- vim.lsp.config('*', { capabilities = capabilities })

    local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

    -- This is the new global configuration for LSP floating windows
    vim.lsp.config("*", {
      capabilities = capabilities,
      -- Configure the UI of the floating windows
      window = {
        hover = { border = border },
        signature_help = { border = border },
      },
    })
    -- Set the color for the currently selected item in the Tab menu
    -- #81A1C1 is the color you requested
    -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#81A1C1", fg = "#2E3440" })

    -- Optional: If you want to style the rest of the dropdown to match
    -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2E3440", fg = "#D8DEE9" })
    -- vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#81A1C1" })
    -- Styling the Hover/Documentation windows (K)

    -- Keybindings: Only active when an LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      end,
    })

    -- Enable your languages
    local servers = {
      "lua_ls",
      "pyright",
      "ruff",
      "vtsls",
      "jsonls",
      "biome",
      "clangd",
      "html",
      "cssls",
      "emmet_ls",
      "ruby_lsp",
      "eslint",
      "vuels",
      "marksman",
    }
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}

--
--
--
--
--
-- return {
--   {
--     'hrsh7th/nvim-cmp',
--     dependencies = {
--       'hrsh7th/cmp-nvim-lsp',     -- Allows cmp to see LSP suggestions
--       'L3MON4D3/LuaSnip',         -- Snippet engine (required)
--       'saadparwaiz1/cmp_luasnip', -- Snippet completions
--     },
--     config = function()
--       local cmp = require('cmp')
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             require('luasnip').lsp_expand(args.body)
--           end,
--         }, mapping = cmp.mapping.preset.insert({ ['<C-b>'] = cmp.mapping.scroll_docs(-4), ['<C-f>'] = cmp.mapping.scroll_docs(4), ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to accept
--           ['<Tab>'] = cmp.mapping.select_next_item(),
--           ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--         }),
--         sources = cmp.config.sources({
--           { name = 'nvim_lsp' }, -- This pulls from your lua_ls
--           { name = 'luasnip' },  -- This pulls from your snippets
--         }, {
--           { name = 'buffer' },   -- This pulls from text in the current file
--         })
--       })
--
--
--       -- Add this line to get the capabilities from cmp-nvim-lsp
--       --
--       vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(event)
--     local opts = { buffer = event.buf }
--     local builtin = require('telescope.builtin')
--     -- 'gd' stands for Go to Definition
--      vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
--     -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--
--     -- 'gD' stands for Go to Declaration (rarely used, but good to have)
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--
--     -- 'gi' stands for Go to Implementation
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--
--     -- 'gr' stands for Go to References (shows everywhere this variable is used)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--
--     -- 'K' shows documentation/hover information
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--
-- -- Extra bonus: Use it for References and Implementations too!
--     vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
--     vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
--     -- In your LspAttach callback
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP Code Actions" })
--
--
--     -- Search diagnostics across the entire project
-- vim.keymap.set('n', '<leader>xd', require('telescope.builtin').diagnostics, { desc = "LSP Diagnostics" })
--   end,
-- })
--     end
--   }
-- }
