return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  -- config = true -- This runs the default setup automatically
  config = function()
  require('nvim-autopairs').setup({
    check_ts = true, -- Enable Treesitter integration
    ts_config = {
      lua = {'string'},-- Don't add pairs in lua string treesitter nodes
      javascript = {'template_string'},
    },
    -- Don't add pairs if the next character is alphanumeric
    fast_wrap = {}, 
    disable_filetype = { "TelescopePrompt" },
  })
end
}
