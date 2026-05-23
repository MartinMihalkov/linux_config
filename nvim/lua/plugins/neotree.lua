return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		require("neo-tree").setup({
			-- Your config goes here
			filesystem = {

				filtered_items = {
					visible = true, -- This makes filtered items (like dotfiles) visible
					hide_dotfiles = false,
					hide_gitignored = false, -- Optional: set to false to see .gitignore'd files too
					hide_by_name = {
						-- ".DS_Store",
						-- "thumbs.db",
					},
					never_show = { -- remains hidden even if visible is true
						-- ".git",
					},
				},

				hijack_netrw = true,
				use_libuv_file_watcher = true,
				-- It's a good idea to have this enabled so the tree knows
				-- where you are before you hit "H"
				follow_current_file = { enabled = true },
			},
			window = {

				mappings = {
				},
			},
		})

		-- Toggle Neo-tree with Space + e
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })

		vim.keymap.set("n", "<leader>fp", function()
			local path = vim.fn.input("Jump to path: ", "", "dir")
			if path ~= "" then
				vim.cmd("Neotree dir=" .. path)
			end
		end, { desc = "Neo-tree: Jump to specific path" })
	end,
}
