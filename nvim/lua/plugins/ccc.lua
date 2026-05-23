return {
	"uga-rosa/ccc.nvim",
	config = function()
		local ccc = require("ccc")
		ccc.setup({
			-- Highlighting is built-in, but we can set it to use
			-- the same style as your colorizer
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})

		-- --- KEYMAPS ---
		-- Open the color picker
		vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<cr>", { desc = "Color Picker" })

		-- Cycle through different color formats (Hex -> RGB -> HSL)
		vim.keymap.set("n", "<leader>cc", "<cmd>CccConvert<cr>", { desc = "Color Convert" })
	end,
}
