return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-buffer',    -- THIS IS WHAT YOU ARE LIKELY MISSING
    'hrsh7th/cmp-path',      -- File paths
  },
  config = function()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },

      formatting = {
        -- 1. Removed "menu" from fields to hide the right column labels
        fields = { "kind", "abbr" }, 
        format = function(entry, vim_item)
          local kind_icons = {
            Text = "", Method = "󰆧", Function = "󰊕", Constructor = "",
            Field = "󰇵", Variable = "󰂡", Class = "󰠱", Interface = "",
            Module = "", Property = "󰜢", Unit = "", Value = "󰎟",
            Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
            File = "󰈙", Reference = "", Folder = "󰉋", EnumMember = "",
            Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
            TypeParameter = "󰅲",
          }
          
          -- 2. This line puts the icon into the 'kind' column
          vim_item.kind = kind_icons[vim_item.kind] or ""
          
          -- 3. Explicitly clear the menu so no [LSP] or [Snippet] text appears
          vim_item.menu = ""
          
          return vim_item
        end,
      },

      window = {
        completion = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
        },
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' }, -- Fixed the nested brace error here
        { name = 'path' },
      },

      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<CR>'] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        }), 

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
    })
  end
}
--
--
--
--
--
--
--
--
--
-- return {
--   'hrsh7th/nvim-cmp',
--   dependencies = {
--     'L3MON4D3/LuaSnip',          -- The Engine
--     'saadparwaiz1/cmp_luasnip',  -- The Bridge
--     'rafamadriz/friendly-snippets', -- THE PACKET YOU NEED
--   },
--   config = function()
--     local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--     local cmp = require('cmp')
--     local luasnip = require('luasnip')
--
-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )
--
-- require("luasnip.loaders.from_vscode").lazy_load()
--     cmp.setup({
--       completion = {
--     completeopt = 'menu,menuone,noinsert,noselect',
--   },
--
--
-- formatting = {
--     fields = { "kind", "abbr"}, -- Order of the columns
--     -- fields = { "kind", "abbr", "menu" }, -- Order of the columns
--     format = function(entry, vim_item)
--       -- Kind icons (you can replace these strings with Nerd Font symbols)
--       local kind_icons = {
--         Text = "", Method = "󰆧", Function = "󰊕", Constructor = "",
--         Field = "󰇵", Variable = "󰂡", Class = "󰠱", Interface = "",
--         Module = "", Property = "󰜢", Unit = "", Value = "󰎟",
--         Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
--         File = "󰈙", Reference = "", Folder = "󰉋", EnumMember = "",
--         Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
--         TypeParameter = "󰅲",
--       }
--       -- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
--       -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
--
--       -- Source labels (shown on the right)
--       -- vim_item.menu = ({
--       --   nvim_lsp = "[LSP]",
--       --   luasnip = "[Snippet]",
--       --   buffer = "[Buffer]",
--       --   path = "[Path]",
--       --   emmet_ls = "[Emmet]",
--       -- })[entry.source.name]
--
--       vim_item.menu = " "
--       return vim_item
--     end,
--   },
--
--
--
--
--
--
--
-- window = {
-- completion = {
--     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--     winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
--   },
--   documentation = {
--       border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--       winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
--     },
--   },
--
--       sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' }, -- Add this so your own snippets show up
--         { name = 'buffer' },
--         { name = 'path' },
--       },
--       -- Keymaps for jumping through snippet placeholders
--       mapping = cmp.mapping.preset.insert({
--         ['<Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--
--        ['<CR>'] = cmp.mapping({
--       i = function(fallback)
--         if cmp.visible() and cmp.get_active_entry() then
--           -- If the menu is open AND you have manually picked an item
--           cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
--         else
--           -- If the menu is closed OR you haven't moved the selection yet
--           fallback()
--         end
--       end,
--       s = cmp.mapping.confirm({ select = true }),
--       c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
--     }), 
--
--
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--       }),
--     })
--   end
-- }
