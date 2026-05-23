-- return {
--   {
--     "hedyhli/outline.nvim",
--     lazy = true,
--     cmd = { "Outline", "OutlineOpen" },
--     keys = {
--       { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
--     },
--     opts = {
--       outline_window = {
--         position = 'right',
--         width = 25,
--       },
--     },
--   },
-- }
--
--
--
--
-- Complete AstroVim-style Structure and Breadcrumbs Setup
-- This file includes both the Sidebar (Outline) and the Winbar (Dropbar)

-- return {
--   -- 1. THE STRUCTURE TREE (Right Sidebar)
--   {
--     "hedyhli/outline.nvim",
--     lazy = true,
--     cmd = { "Outline", "OutlineOpen" },
--     keys = {
--       { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline (Structure)" },
--     },
--     opts = {
--       outline_window = {
--         position = 'right',
--         width = 30, -- Slightly wider for better readability
--         relative_width = true,
--       },
--       outline_items = {
--         show_parent_ids = true,
--       },
--       symbols = {
--         -- Customizing icons to look modern
--         icon_source = "lspkind", 
--       },
--     },
--   },
--
--   -- 2. THE BREADCRUMBS (Top Winbar)
--   {
--     "Bekaboo/dropbar.nvim",
--     dependencies = {
--       "nvim-telescope/telescope-fzf-native.nvim",
--       "nvim-tree/nvim-web-devicons",
--     },
--     event = "BufReadPost", -- Load when you open a file
--     config = function()
--       local dropbar = require('dropbar')
--       
--       dropbar.setup({
--         bar = {
--           -- This ensures it shows up in most buffers
--           enable = function(buf, win)
--             return not vim.api.nvim_win_get_config(win).zindex
--               and vim.bo[buf].buftype == ''
--               and vim.api.nvim_buf_get_name(buf) ~= ''
--           end,
--         },
--         icons = {
--           ui = {
--             bar = {
--               separator = "  ", -- Elegant chevron separator
--             },
--           },
--         },
--       })
--
--       -- APPLY YOUR COLOR THEME (#81A1C1)
--       -- This makes the breadcrumbs match your blue accent
--       vim.api.nvim_set_hl(0, "DropBarMenuHoverEntry", { fg = "#81A1C1", bold = true })
--       vim.api.nvim_set_hl(0, "DropBarIconUISeparator", { fg = "#81A1C1" })
--     end
--   },
-- }
--
--
-- Complete AstroVim-style Structure and Breadcrumbs Setup
-- Focuses on File Symbols and removes folder path prefixes

return {
  -- 1. THE STRUCTURE TREE (Right Sidebar)
  {
    "hedyhli/outline.nvim",
    dependencies = { "onsails/lspkind.nvim"},
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline (Structure)" },
    },
    opts = {
      outline_window = {
        position = 'right',
        width = 30,
        relative_width = true,
      },
      outline_items = {
        show_parent_ids = true,
      },
      symbols = {
        icon_source = "lspkind", 
      },
    },
  },

  -- 2. THE BREADCRUMBS (Top Winbar - Clean View)
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufReadPost",
    config = function()
      local dropbar = require('dropbar')
      local sources = require('dropbar.sources')
      
      dropbar.setup({
        bar = {
          -- Logic to determine where and when the bar shows
          enable = function(buf, win)
            return not vim.api.nvim_win_get_config(win).zindex
              and vim.bo[buf].buftype == ''
              and vim.api.nvim_buf_get_name(buf) ~= ''
              and not vim.wo[win].diff -- Don't show in diff mode
          end,
          -- HIDE FOLDERS: We only include markdown, lsp, and treesitter
          -- We explicitly exclude sources.path
          sources = function(buf, win)
            return {
              sources.markdown,
              sources.lsp,
              sources.treesitter,
            }
          end,
        },
        icons = {
          ui = {
            bar = {
              separator = "  ", -- Elegant chevron separator
            },
          },
        },
      })

      -- APPLY YOUR COLOR THEME (#81A1C1)
      vim.api.nvim_set_hl(0, "DropBarMenuHoverEntry", { fg = "#81A1C1", bold = true })
      vim.api.nvim_set_hl(0, "DropBarIconUISeparator", { fg = "#81A1C1" })
      -- Optional: Set the main winbar color to your blue
      vim.api.nvim_set_hl(0, "DropBarKindFunction", { fg = "#81A1C1" })
    end
  },
}
