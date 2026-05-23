vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.o.clipboard = 'unnamedplus'
-- Wrapping settings
vim.opt.wrap = true
vim.opt.linebreak = true -- break lines at word boundaries
vim.opt.laststatus = 2
vim.opt.breakindent = true -- visually indent wrapped lines
vim.opt.showbreak = "↪ " -- symbol for wrapped lines
vim.opt.cursorline = true

vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 4
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches

vim.o.backspace = 'indent,eol,start' -- allow backspace on
vim.o.pumheight = 10 -- pop up menu height
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = 'utf-8' -- the encoding written to a file
vim.o.smartindent = true -- make indenting smarter again


vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window


vim.o.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.autoindent = true
-- Highlight only the line number with your blue
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#81A1C1", bold = true })

-- Optional: Highlight the background of the entire line
-- Note: 'bg' should usually be a dark color so text stays readable
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#76747a" }) -- A dark Nord-style background

-- Indentation settings (Native Lua version)
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.softtabstop = 2 -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Change the color of all line numbers (dim them slightly)
vim.api.nvim_set_hl(0, "LineNr", { fg = "red" })

-- Make the current line number Orange and Bold
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })

vim.diagnostic.config({
	virtual_text = {
		source = "always", -- Shows if the error is from Pyright or Ruff
		prefix = "●", -- A nice little dot before the error
	},
	signs = true, -- Shows icons in the gutter (sidebar)
	underline = true, -- Underlines the actual broken code
	update_in_insert = false, -- Don't scream at you while you're still typing
	severity_sort = true,
})
