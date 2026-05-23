return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        globalstatus = false,
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        theme = "auto", -- or "dracula", "gruvbox", "tokyonight"
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Highly recommended: one statusline at the bottom for all windows
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      section = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        -- Modify lualine_c to include the path
        lualine_c = {
          {
            function()
              return require("outline").get_breadcrumb()
            end,
            cond = function()
              -- Only show if outline is initialized
              return package.loaded["outline"] ~= nil
            end,
          }
        },
        -- lualine_c = {
        --   {
        --     "filename",
        --     path = 1, -- 0: Name only, 1: Relative path, 2: Absolute path, 3: Absolute with ~
        --     shorting_target = 40,
        --   },
        -- },
        lualine_c = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
            color = { fg = "#81A1C1" }, -- Using your preferred blue
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
--
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     require("lualine").setup({
--       options = {
--         theme = "auto",
--         component_separators = { left = "", right = "" },
--         section_separators = { left = "", right = "" },
--         globalstatus = true,
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch", "diff", "diagnostics" },
--         -- This is the part that changes:
--         lualine_c = {
--           {
--             "filename",
--             path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path
--           },
--         },
--         lualine_x = { "encoding", "fileformat", "filetype" },
--         lualine_y = { "progress" },
--         lualine_z = { "location" },
--       },
--     })
--   end,
-- }
