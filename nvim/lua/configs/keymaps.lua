-- Move Tab Left (with wrap-around)
-- vim.keymap.set("n", "<S-h>", function()
--   local tab_count = vim.fn.tabpagenr('$')
--   local current_tab = vim.fn.tabpagenr()
--   if tab_count > 1 then
--     local target = (current_tab - 2) % tab_count
--     vim.cmd("tabmove " .. target)
--   end
-- end, { desc = "Move tab left safely" })
--
-- -- Move Tab Right (with wrap-around)
-- vim.keymap.set("n", "<S-l>", function()
--   local tab_count = vim.fn.tabpagenr('$')
--   local current_tab = vim.fn.tabpagenr()
--   if tab_count > 1 then
--     local target = current_tab % tab_count
--     vim.cmd("tabmove " .. target)
--   end
-- end, { desc = "Move tab right safely" })
-- Open the diagnostic floating window (the "inlay issue")
vim.keymap.set("n", "<leader>y", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.o.wrap = true -- display lines as one long line
vim.o.undofile = true -- Save undo history

-- General mapping to open the breadcrumb "picker"
vim.keymap.set('n', '<leader>dp', function()
  require('dropbar.api').pick()
end, { desc = 'Pick from dropbar' })

-- Open a list of all diagnostics in the current buffer
vim.keymap.set('n', '<leader>dd', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })

vim.o.breakindent = true -- Enable break indent
vim.o.hlsearch = false -- Set highlight on search

vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.


-- Move tab left (Quietly fails at edge)
vim.keymap.set("n", "<S-h>", "<cmd>silent! -tabmove<cr>", { silent = true })

-- Move tab right (Quietly fails at edge)
vim.keymap.set("n", "<S-l>", "<cmd>silent! +tabmove<cr>", { silent = true })

-- Go to the next tab
vim.keymap.set("n", "<leader>j", "gt", { desc = "Next tab" })

-- Go to the previous tab
vim.keymap.set("n", "<leader>k", "gT", { desc = "Previous tab" })

-- Create a new tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })

-- Close the current tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
--
--
--
--
--
--
--
--

-- Above: Move up, delete, move back
vim.keymap.set("n", "[d", "m`:.-1delete<cr>``", { silent = true })

-- Below: Delete the specific line number
vim.keymap.set("n", "]d", "m`:.+1delete<cr>``", { silent = true })

function _G.delete_above()
  vim.cmd("normal! kddj")
end

function _G.delete_below()
  vim.cmd("normal! jddk")
end

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Exit nvim" })

vim.keymap.set("n", "<C-q>", "<cmd>q<cr>", { desc = "Exit nvim" })
vim.keymap.set("n", "<C-S-q>", "<cmd>qa!<cr>", { desc = "Exit nvim" })

-- Move current tab to the left (with wrap-around)
vim.keymap.set("n", "<leader>K", function()
  local idx = vim.fn.tabpagenr()
  if idx <= 1 then
    vim.cmd("tabmove $") -- Move to the very end if at the start
  else
    vim.cmd("tabmove -1")
  end
end, { desc = "Move tab left" })

-- Move current tab to the right (with wrap-around)
vim.keymap.set("n", "<leader>J", function()
  local idx = vim.fn.tabpagenr()
  local last = vim.fn.tabpagenr("$")
  if idx >= last then
    vim.cmd("tabmove 0") -- Move to the very start if at the end
  else
    vim.cmd("tabmove +1")
  end
end, { desc = "Move tab right" })

--
--
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>q",
-- 	"<cmd>Neotree close<cr><cmd>q<cr>",
-- 	{ desc = "Close Neo-tree and Quit", silent = true })

-- vim.keymap.set("n", "<leader>q", function()
-- 	-- 1. Force Neo-tree to close if it's visible
-- 	vim.cmd("Neotree close")
--
-- 	pcall(vim.cmd, "q")
-- end, { desc = "Close Neo-tree and Quit", silent = true })

vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- This opens the command line with ":tabedit " already typed for you
vim.keymap.set("n", "<leader>te", "<cmd>tabedit<cr>", { desc = "New tab with file prompt" })
vim.keymap.set("n", "<leader>k", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>j", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Alternatively, use Alt + Number to jump directly
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Jump to Tab " .. i })
end

-- Append semicolon at end of line and stay in Insert Mode
vim.keymap.set("i", "<C-;>", function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Modify the line string directly
  vim.api.nvim_set_current_line(line .. ";")

  -- Restore cursor to original position
  vim.api.nvim_win_set_cursor(0, cursor)
end, { desc = "Append semicolon at end of line (Insert)" })

-- Append comma at end of line and stay in Insert Mode
vim.keymap.set("i", "<C-,>", function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Modify the line string directly
  vim.api.nvim_set_current_line(line .. ",")

  -- Restore cursor to original position
  vim.api.nvim_win_set_cursor(0, cursor)
end, { desc = "Append comma at end of line (Insert)" })


-- Delete the last character of the line while staying in Insert Mode
vim.keymap.set("i", "<C-x>", "<C-o>mx<C-o>$<C-o>x<C-o>`x", { desc = "Delete last char of line and return" })

vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>", { desc = "New buffer" })
vim.keymap.set("n", "<C-x>", function()
    local line = vim.api.nvim_get_current_line()
    if #line > 0 then
        -- Remove the last character
        vim.api.nvim_set_current_line(line:sub(1, -2))
    end
end, { desc = "Delete last char without moving cursor" })

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("write")
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local output = vim.fn.expand("%:r")
  local dir_path = vim.fn.expand("%:p:h")
  local file_name = vim.fn.expand("%:t")
  local file_name_no_ext = vim.fn.expand("%:t:r")
  local cmd = ""
  if ext == "cpp" or ext == "c" then
    cmd = 'cd "'
        .. dir_path
        .. '" && g++ '
        .. file_name
        .. " -o "
        .. file_name_no_ext
        .. " && "
        .. "./"
        .. file_name_no_ext
  elseif ext == "js" then
    cmd = 'cd "' .. dir_path .. '" && node ' .. file_name
  elseif ext == "ts" then
    cmd = 'cd "' .. dir_path .. '" && ts-node ' .. file_name
  elseif ext == "py" then
    cmd = 'cd "' .. dir_path .. '" && python ' .. file_name
  elseif ext == "lua" then
    cmd = 'cd "' .. dir_path .. '" && lua ' .. file_name
  elseif ext == "sh" or ext == "bash" then
    cmd = 'cd "' .. dir_path .. '" && chmod +x ' .. file_name .. "&& ./" .. file_name
  elseif ext == "rb" then
    cmd = 'cd "' .. dir_path .. '" && ruby ' .. file_name
  end

  if cmd ~= "" then
    -- 1. Check if the previous terminal buffer exists and delete it
    if _G.run_term_buf and vim.api.nvim_buf_is_valid(_G.run_term_buf) then
      vim.api.nvim_buf_delete(_G.run_term_buf, { force = true })
    end

    -- 2. Open the new terminal in a split
    vim.cmd("botright 8split")
    vim.cmd("term " .. cmd)

    -- 3. Store the new buffer ID so we can close it next time
    _G.run_term_buf = vim.api.nvim_get_current_buf()

    -- 4. Move focus back to the code window
    vim.cmd("wincmd p")
  end
end, { desc = " Run Code" })

vim.keymap.set("n", "<leader>;", function()
  local cursor = vim.api.nvim_win_get_cursor(0) -- Save current position
  vim.cmd("normal! A;")                        -- Append semicolon at end
  vim.api.nvim_win_set_cursor(0, cursor)       -- Jump back
end, { desc = "Append semicolon at end of line" })

vim.keymap.set("n", "<leader>,", function()
  local cursor = vim.api.nvim_win_get_cursor(0) -- Save current position
  vim.cmd("normal! A,")                        -- Append semicolon at end
  vim.api.nvim_win_set_cursor(0, cursor)       -- Jump back
end, { desc = "Append semicolon at end of line" })

vim.keymap.set("n", "<leader>dj", vim.diagnostic.open_float, { desc = "Show error message" })

-- Show all errors in a list (Quickfix window)
vim.keymap.set("n", "<leader>do", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

--
--
--
--
--
--
---- Exit terminal mode with Escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
local modes = { "n", "v", "i", "t" }
-- Navigate windows using Ctrl + hjkl
vim.keymap.set({"n", "v"}, "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set(modes, "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Open man page for the word under the cursor
vim.keymap.set('n', '<leader>om', ':Man <C-R><C-W><CR>', { desc = 'Open Man page' })
