return {
  {
    "stevearc/aerial.nvim",
    enabled = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<leader>cs", "<cmd>AerialToggle!<cr>", desc = "Code Structure (Aerial)" },
    },
  },
}
