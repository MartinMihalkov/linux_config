-- ~/.config/nvim/lsp/ruby_lsp.lua

return {
	-- The executable name you installed via gem
	cmd = { "ruby-lsp" },

	-- Filetypes to trigger this LSP
	filetypes = { "ruby", "eruby" },

	-- Files that indicate the "root" of your project
	root_markers = { "Gemfile", ".git", ".ruby-version" },

	-- Optional: Configure the formatter (ruby-lsp supports rubocop/syntax_tree)
	init_options = {
		formatter = "auto", -- or "rubocop"
		linters = { "rubocop" },
	},

	-- Ensure it works for single files as well
	single_file_support = true,
}
