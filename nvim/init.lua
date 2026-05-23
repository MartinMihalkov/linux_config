require("configs.colors")
require("configs.settings")
require("configs.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Disable the default <Tab>
vim.g.copilot_no_tab_map = true

vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})

-- The most robust, future-proof way to force borders on all LSP floats
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end



-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "python", "lua", "javascript", "typescript", "rust", "cpp" },
--   callback = function()
--     -- Only open if it's not already open
--     require("aerial").open() 
--   end,
-- })


require("lazy").setup("plugins")

local undodir = vim.fn.expand("~/.local/state/nvim/undo")

-- Create the directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p", "0o700")
end

vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = undodir -- Set the directory
vim.opt.undolevels = 10000 -- How many changes to remember
vim.opt.undoreload = 10000 -- Buffer reload undo limit
vim.opt.swapfile = true
vim.opt.directory = vim.fn.expand("~/.local/state/nvim/swap//") -- // prevents name collisions

function MyTabLine()
	local s = ""
	-- Try to get the devicons module
	local ok, devicons = pcall(require, "nvim-web-devicons")

	for i = 1, vim.fn.tabpagenr("$") do
		local is_selected = i == vim.fn.tabpagenr()
		s = s .. (is_selected and "%#TabLineSel#" or "%#TabLine#")
		s = s .. "%" .. i .. "T"

		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)
		local bufnr = buflist[winnr]
		local bufname = vim.fn.bufname(bufnr)
		local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
		local extension = vim.fn.fnamemodify(filename, ":e")

		-- Fetch icon with a manual fallback if plugin fails
		local icon = ""
		if ok then
			icon = devicons.get_icon(filename, extension, { default = true })
		else
			icon = "󰈔" -- A generic document icon string
		end

		local modified = ""
		for _, b in ipairs(buflist) do
			if vim.fn.getbufvar(b, "&modified") == 1 then
				modified = " ●"
				break
			end
		end

		s = s .. "  " .. icon .. " " .. filename .. modified .. "  "
	end

	s = s .. "%#TabLineFill#%T"
	return s
end
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#2e3440", bg = "#81A1C1", bold = true })
-- fg = Text color, bg = The "Rectangle" color
-- vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#1e1e2e", bg = "#89b4fa", bold = true })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#1e1e2e", bg = "#7f8383", bold = true })

-- Optional: Change the unselected tabs to be more subtle
vim.api.nvim_set_hl(0, "TabLine", { fg = "#6c7086", bg = "#313244" })

-- Optional: Change the empty bar background
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })



vim.api.nvim_set_hl(0, "MatchParen", { 
  bg = "NONE", 
  fg = "#81A1C1", 
  underline = true, 
  bold = true 
})
-- Saves the last cursor position vim.api.nvim_create_autcmd("BufReadPost", {
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local lcount = vim.api.nvim_buf_line_count(0)
--     if mark[1] > 0 and mark[1] <= lcount then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })
-- Create Splits
-- vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr><C-j>", { desc = "Split Vertical" })
-- vim.keymap.set("n", "<leader>h", "<cmd>split<cr><C-l>", { desc = "Split Horizontal" })
-- vsplit (Vertical) usually needs focus to move Right (l)
vim.keymap.set("n", "<leader>h", "<cmd>vsplit<cr><C-w>l", { desc = "Split Horizontal" })

-- split (Horizontal) usually needs focus to move Down (j)
vim.keymap.set("n", "<leader>v", "<cmd>split<cr><C-w>j", { desc = "Split Vertical" })

-- Close Split
vim.keymap.set("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close Split" })
-- Saves the last cursor position and centers the screen
--
--
-- Resize splits
vim.keymap.set("n", "<M-k>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<M-j>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<M-h>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>vertical resize +2<cr>")

-- Rotate windows clockwise
vim.keymap.set("n", "<C-M-r>", "<C-w>r", { desc = "Rotate windows clockwise" })

-- Swap current window with the next one
vim.keymap.set("n", "<C-M-x>", "<C-w>x", { desc = "Swap window with next" })
-- Rotate windows
vim.keymap.set("n", "<C-M-R>", "<C-w>r", { desc = "Rotate windows counter clockwise" })

-- Change vertical to horizontal
vim.keymap.set("n", "<leader>tv", "<C-w>t<C-w>K", { desc = "Change Vertical to Horizontal" })

-- Change horizontal to vertical
vim.keymap.set("n", "<leader>th", "<C-w>t<C-w>H", { desc = "Change Horizontal to Vertical" })
-- Move window to far left/right/top/bottom

-- Move the current window position (Reorder splits)
vim.keymap.set("n", "<C-M-h>", "<C-w>H", { desc = "Move window to far left" })
vim.keymap.set("n", "<C-M-j>", "<C-w>J", { desc = "Move window to bottom" })
vim.keymap.set("n", "<C-M-k>", "<C-w>K", { desc = "Move window to top" })
vim.keymap.set("n", "<C-M-l>", "<C-w>L", { desc = "Move window to far right" })

vim.keymap.set("n", "<Leader>T", "<C-w>T", { desc = "Move current file into a new tab" })

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			-- 1. Move the cursor to the saved position
			vim.api.nvim_win_set_cursor(0, mark)
			-- 2. Center the screen (zz)
			vim.cmd("normal! zz")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { remap = false, buffer = true })
    vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { remap = false, buffer = true })
    vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { remap = false, buffer = true })
    vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { remap = false, buffer = true })
  end,
})

local function move_buf_to_tab_split(tab_number)
	local bufnr = vim.api.nvim_get_current_buf()

	-- 1. Close the current window to "remove" it from the current tab
	local success = pcall(vim.cmd, "close")

	if success then
		-- 2. Simulate pressing your <leader> + number shortcut to switch tabs
		local key = vim.api.nvim_replace_termcodes("<leader>" .. tab_number, true, false, true)
		vim.api.nvim_feedkeys(key, "m", false)

		-- 3. Schedule the split to happen AFTER the tab switch
		vim.schedule(function()
			-- 'vsplit' creates a vertical split; use 'split' for horizontal
			-- 'sb' (split buffer) is a shortcut that splits and opens the buf
			vim.cmd("vsplit | buffer " .. bufnr)
		end)
	end
end
-- Create the <leader>m[1-9] mappings
for i = 1, 9 do
	vim.keymap.set("n", "<leader>m" .. i, function()
		move_buf_to_tab_split(i)
	end, { desc = "Move buffer to tab as a new split" })
end

-- Search for the current visual selection
vim.keymap.set("v", "//", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], { desc = "Search for selection" })

