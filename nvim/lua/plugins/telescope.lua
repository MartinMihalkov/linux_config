return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Note: 'make' must be installed on your system for fzf-native to build
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require('telescope.builtin')
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        -- Optional: configure your default prompt or mappings here
      },
      extensions = {
        ["ui-select"] = {
          -- This specifically styles the "Correction Suggestions" menu
          themes.get_dropdown({
            -- You can add more telescope options here
          })
        }
      }
    })

    -- Load the extensions to activate them
    telescope.load_extension("ui-select")
    -- Use pcall (protected call) in case fzf-native failed to compile
    pcall(telescope.load_extension, "fzf")

    -- --- KEYMAPS ---

    -- 1. CORRECTION SUGGESTIONS (Code Actions)
    -- This is the one you were looking for! 
    -- Put your cursor on an error/warning and press <leader>ca
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions / Corrections" })

    -- 2. BASIC FILE & TEXT SEARCH
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    -- 3. CUSTOM DOCUMENT SEARCH
    -- Search specifically in your Documents folder
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({
        search_dirs = { "/home/martin/Documents" },
        prompt_title = "Find files in Documents",
      })
    end, { desc = "[S]earch [N]otes / Project" })

  end
}
