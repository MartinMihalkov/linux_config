return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- This is important for the new version
  opts = {
    indent = {
      char = "▎", -- You can use "│", "┆", or "▏"
    },
    scope = {
      enabled = true, -- This highlights the active block you are currently in
      show_start = true,
      show_end = false,
      char = "▎",
    },
  },
}

-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   main = "ibl",
--   enabled = true,
--   -- 'init' runs BEFORE the plugin loads
--   init = function()
--     vim.api.nvim_set_hl(0, "FunctionHighlight", { fg = "#81A1C1", bold = true })
--   end,
--   -- 'opts' is the configuration
--   opts = {
--     scope = {
--       enabled = true,
--       highlight = { "FunctionHighlight" },
--     },
--   },
-- }
