-- Normal item background and foreground
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
-- Selected item
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "NONE", bg = "#334155" })

-- Specific colors for the completion menu types
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#E2E49B" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9CDCFE" })
