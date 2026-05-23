return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    -- In some new versions, setup is called directly on the main module
    ts.setup({
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
    })
    -- 2. Enable Treesitter Folding
    -- These are Neovim options, not Treesitter setup options
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    -- 3. Folding Behavior (Optional but Recommended)
    vim.opt.foldlevel = 99  -- Start with all folds open
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true -- Enable folding

    -- Custom fold text function
    _G.custom_fold_text = function()
      local line = vim.fn.getline(vim.v.foldstart)
      local line_count = vim.v.foldend - vim.v.foldstart + 1
      return "  " .. line
    end

    -- Apply the custom function
    vim.opt.foldtext = "v:lua.custom_fold_text()"

    -- Optional: Clean up the "fold column" on the left
    vim.opt.fillchars = { fold = " ", foldopen = "", foldsep = " ", foldclose = "" }
  end,
}
