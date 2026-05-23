return {
  "numToStr/Comment.nvim",
  opts = {},
  config = function()
    local comment = require("Comment")
    local api = require("Comment.api")

    comment.setup()

    -- 1. Helper Function: Toggle and Shift Cursor
    local function toggle_comment_shifted()
      local cursor = vim.api.nvim_win_get_cursor(0)
      local old_line_len = #vim.api.nvim_get_current_line()

      -- Toggle the comment
      api.toggle.linewise.current()

      local new_line = vim.api.nvim_get_current_line()
      local new_line_len = #new_line
      local shift = new_line_len - old_line_len

      -- Calculate new position (row stays the same, column shifts)
      -- math.max(0, ...) prevents moving to a negative column
      local new_col = math.max(0, cursor[2] + shift)

      vim.api.nvim_win_set_cursor(0, { cursor[1], new_col })
    end

    -- 2. KEYMAPS

    -- NORMAL MODE: Toggle current line (Shifted)
    vim.keymap.set("n", "<leader>/", toggle_comment_shifted, { desc = "Comment toggle (stay in place)" })

    -- VISUAL MODE: Toggle selection
    vim.keymap.set(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>",
      { desc = "Comment toggle selection" }
    )

    -- INSERT MODE: Toggle and Shift (Supports both C-/ and C-_)
    vim.keymap.set("i", "<C-/>", toggle_comment_shifted, { desc = "Comment toggle (stay in place)" })
    vim.keymap.set("i", "<C-_>", toggle_comment_shifted, { desc = "Comment toggle (stay in place)" })
  end,
}
