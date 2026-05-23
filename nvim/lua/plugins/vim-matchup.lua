return {
  "andymass/vim-matchup",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
    -- This enables the highlighting of both 'then' and 'end' 
    -- when your cursor is on one of them.
    vim.g.matchup_matchparen_enabled = 1
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
