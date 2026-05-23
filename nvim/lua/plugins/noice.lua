return {
  "folke/noice.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify", -- Optional but recommended
  },
  opts = {
    lsp = {
      hover = {
        enabled = true,
        silent = true, -- Don't show message if hover isn't available
      },
    },
    presets = {
      bottom_search = true, 
      command_palette = true, 
      long_message_to_split = true, 
    },
  },
}
