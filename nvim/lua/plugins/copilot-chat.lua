return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or "github/copilot.vim"
      { "nvim-lua/plenary.nvim" }, 
    },
    -- REMOVED the build = "make utf8" line to fix your error
    opts = {
      debug = false, 
      window = {
        layout = 'vertical',
        width = 0.4,
        side = 'right',
      },
    },
    keys = {
      { "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      {
        "<leader>ce",
        "<cmd>CopilotChatExplain<cr>",
        mode = "v",
        desc = "CopilotChat - Explain code",
      },
      {
        "<leader>cf",
        "<cmd>CopilotChatFix<cr>",
        mode = "v",
        desc = "CopilotChat - Fix code",
      },
    },
  },
}
