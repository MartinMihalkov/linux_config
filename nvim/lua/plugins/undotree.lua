return {
  "mbbill/undotree",
  keys = {
    {
      "<leader>u",
      function()
        vim.cmd.UndotreeToggle()
        -- Only focus if Undotree actually opened
        if vim.fn["undotree#UndotreeIsVisible"]() == 1 then
          vim.cmd.UndotreeFocus()
        end
      end,
      desc = "Toggle and Focus Undotree",
    },
  },
}
