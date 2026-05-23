-- 1. Set settings BEFORE the plugin is even loaded
-- This bypasses the need for .setup() entirely
vim.g.live_server_browser = "vivaldi"
vim.g.live_server_port = 8080

return {
  "barrett-ruth/live-server.nvim",
  build = "pnpm add -g live-server",
  -- We leave opts out to prevent Lazy from auto-calling .setup()
  config = function()
    -- We only set keymaps here
    vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Start Live Server" })
    vim.keymap.set("n", "<leader>lx", "<cmd>LiveServerStop<cr>", { desc = "Stop Live Server" })
  end,
}
